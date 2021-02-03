{ pkgs, colours, ... }:

derivation rec {
    name = "discord-base16";
    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        ${coreutils}/bin/mkdir -p $out/share/
        ${coreutils}/bin/ln -s $desktopItem/share/applications $out/share/applications
    ''];
    system = builtins.currentSystem;

    # Launch with wrapper instead
    desktopItem = pkgs.makeDesktopItem {
        name = "Discord";
        exec = "${injector}/bin/discocss";
        desktopName = "Discord";
    };

    # CSS File to inject
    cssFile = pkgs.writeTextFile {
        name = "discord_base16.css";
        text = ''
/**
 * @name Comfy
 * @author Nyria#0001
 * @description A simple customisable Discord theme
 * @version 2.0
 */

 @import "https://nyri4.github.io/Comfy/BetterDiscord/main.css";

 /* No scrollbars --> Delete all until "Mention color" if u don't want it */
 /* ::-webkit-scrollbar { display: none !important;}
 .note-3HfJZ5 { margin-right: 0; }
 .content-1x5b-n { margin: 0 !important; border-radius: 0; }
 .mainContent-u_9PKf { padding-left: 8px;}
 .member-3-YXUe, [id*="private-channels-"] { margin: 0; max-width: unset; }
 .layout-2DM8Md { border-radius: 0; padding: 0 16px;}
 .unread-2lAfLh { z-index: 1;}
 .content-1LAB8Z, .item-1tOPte { margin-right: 8px;}
 .scroller-2hZ97C { padding-left: 0;}
 .scroller-2hZ97C > .content-3YMskv, .buttons-3JBrkn, .messagesPopout-24nkyi { padding-right: 10px !important; }
 .inviteRow-2L02ae {border-radius: 0; padding-left: 15px;}
 .sidebar-CFHs9e { padding-right : 0; margin: 0 40px 0 20px;}
 .sidebarRegion-VFTUkN { flex: unset;}
 .contentColumn-2hrIYH, .sidebarScrollable-1qPI87+.content-1rPSz4, .customScroller-26gWhv>div, .customColumn-Rb6toI, .hero-EvfTTA { max-width: none;}
 .featuresHeader-4YwLcc { margin-left: 95px;}
 .userSettingsVoice-iwdUCU, .container-3PXSwK { width: auto !important;}
 .menu-3sdvDG .layer-v9HyYc { margin-left: -8px;}
  */
 :root { 
     /* BetterAvatar Popout */
     --popout-status-icon: none; /* Set it to "block" if u want to have the status icon in big popouts */
     --popout-status-mask: none; /* Set it to "url(#svg-mask-avatar-status-round-80)" if u want to enable the avatar mask in big popouts */
     --avatar-radius: 10%; /* Change the roundness of avatar in big popouts, u need to disable the mask to use this */
  
     /* Colored emoji picker */
     --colored-emoji: grayscale(0%); /* Change the value to "100%" if u want the basic one */
 
     /* -- Others settings -- */
 
     /* Mention color */
     --mention-color-bar: ${colours.base08};
     --mention-color-background: ${colours.base08}1f;
     --mention-color-hover: ${colours.base08}1f;
 
     /* Spotify seek bar color */
     --spotify-color: ${colours.base08} !important;
 
     /* User settings color (Mute, Deafen and settings) */
     --user-buttons-color: ${colours.base0F};
 
     /* Chat buttons color */
     --chat-buttons: ${colours.base04};
  
     /* Circles next to role names */
     --role-circle: 0px; /* Set it to "0px" if u don't want circles */
  
     /* Tooltips */
     --tooltips: block; /* Set it to "none" if u don't want it */
 
     /* Discord logo */
     --discord-logo: none; /* Set it to "block" if u want it */
 }
  
 .theme-dark {
     --background-tertiary: ${colours.base02};
     --background-secondary: ${colours.base01};
     --background-secondary-alt: ${colours.base01};
     --background-primary: ${colours.base00};
     --channeltextarea-background: ${colours.base00};
     --background-accent: ${colours.base08};
     --background-modifier-hover: ${colours.base01};
     --background-modifier-active: ${colours.base03};
     --background-modifier-selected: ${colours.base03};
     --deprecated-card-bg: #12141f63;
     --background-floating: ${colours.base03};
     --deprecated-quickswitcher-input-background:#101320;
     --spotify-color: ${colours.base08};
     --elevation-low: none;
     --scrollbar-auto-thumb: ${colours.base01};
     --scrollbar-auto-track: ${colours.base00};
     --scrollbar-thin-thumb: ${colours.base00};
 }
  
 .theme-light { /* I don't support light theme it's just for the "Create a server" popup */
     --background-tertiary: #101320;
     --background-secondary: #1e2233;
     --background-secondary-alt: #191f2e;
     --background-primary: #23283d;
     --header-primary: #fff;
     --header-secondary: #b1b5b9;
     --text-normal: #8e9297;
 }
 '';
    };

    # Phase 1 removes CSP policies.
    phase1Js = pkgs.writeTextFile {
        name = "stage1.js";
        text =  ''
(() => {
    require('electron').session.defaultSession.webRequest.onHeadersReceived(function(details, callback) {
        if (!details.responseHeaders["content-security-policy-report-only"] && !details.responseHeaders["content-security-policy"]) return callback({cancel: false});
        delete details.responseHeaders["content-security-policy-report-only"];
        delete details.responseHeaders["content-security-policy"];
        callback({cancel: false, responseHeaders: details.responseHeaders});
    });
})()
'';
    };

    # Phase 2 adds the CSS file
    phase2Js = pkgs.writeTextFile {
        name = "stage2.js";
        text =  ''
(() => {
  const fs = require("fs");
  const electron = require("electron");
  const cssFile = "${cssFile}";

  function inject({ document, window }) {
    window.addEventListener("load", () => {
      const style = document.createElement("style");
      style.innerHTML = fs.readFileSync(cssFile);
      document.head.appendChild(style);
    });
  }

  inject(electron.webFrame.context);
})();
'';
    };

    # Because we need to keep the size the same when injecting into a .asar, we need to have stable filenames
    # So we use symlinks in /tmp/
    # This means you'll need to remove them when you reinstall.
    injector = pkgs.writeScriptBin "discocss" ''
PATH="$PATH:${pkgs.coreutils}/bin/:${pkgs.discord}/bin/"

ln -s ${phase1Js} /tmp/discocss-phase1.js
ln -s ${phase2Js} /tmp/discocss-phase2.js

sed -i 's|  // global.releaseChannel is set in bootstrap|  require\(`/tmp/discocss-phase1.js`\);         |' \
    "$HOME"/.config/discord/*/modules/discord_desktop_core/core.asar
sed -i 's|  // App preload script, used to provide a replacement native API now that|require\(`/tmp/discocss-phase2.js`\)                                        |' \
    "$HOME"/.config/discord/*/modules/discord_desktop_core/core.asar


command -v discord && exec discord
command -v Discord && exec Discord
'';
}