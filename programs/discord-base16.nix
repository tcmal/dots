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
 * @name Nox
 * @author Lilian Tedone & Zerebos
 * @description A theme for Discord *loosely* based on Google's Material Design Guidelines.
 * @version 1.0.0
 * @authorLink https://twitter.com/IAmZerebos
 * @donate https://paypal.me/ZackRauen
 * @patreon https://patreon.com/Zerebos
 * @website https://github.com/rauenzi/Nox
 * @source https://raw.githubusercontent.com/rauenzi/Nox/master/release/Nox.theme.css
 */

/*
 *  Copyright (c) 2016-2017 Lilian Tedone, 2017-2020 Zack Rauen
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

 @import url(https://rauenzi.github.io/Nox/release/import.css);

 /* Colours */
 :root {
     --nox-accent: ${colours.base00};
     --nox-level1: ${colours.base02};
     
     --nox-level2: ${colours.base01};
     
     --nox-level3: ${colours.base00};
}

/* Don't show message backgrounds / weird triangle */
.message-2qnXI6 {
    background: none !important;
}
.message-2qnXI6::before {
    display: none !important;
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