# Environment Variables
set -gx EDITOR vim
set -gx GOPATH "$HOME/code/go/"
set -gx GOPRIVATE "git.o-c.space*"
fish_add_path "$HOME/.bin/"
fish_add_path "$HOME/.local/bin/"
fish_add_path "$GOPATH/bin/"

alias s='TERM=xterm ssh'

# Direnv
function __direnv_export_eval --on-event fish_prompt;
    "/usr/bin/direnv" export fish | source;

    if test "$direnv_fish_mode" != "disable_arrow";
        function __direnv_cd_hook --on-variable PWD;
            if test "$direnv_fish_mode" = "eval_after_arrow";
                set -g __direnv_export_again 0;
            else;
                "/usr/bin/direnv" export fish | source;
            end;
        end;
    end;
end;

function __direnv_export_eval_2 --on-event fish_preexec;
    if set -q __direnv_export_again;
        set -e __direnv_export_again;
        "/usr/bin/direnv" export fish | source;
        echo;
    end;

    functions --erase __direnv_cd_hook;
end;

# ASDF
source ~/.asdf/asdf.fish

# Fortune on startup
function fish_greeting
    fortune -s computers linux perl songs-poems hitchhiker
end

# Other completions
kubectl completion fish | source

# Hledger GPG
function hl
    gpg2 --decrypt ~/tasks/Ledger.ledger.gpg 2>/dev/null | hledger -f- $argv
end

# pnpm
set -gx PNPM_HOME "/home/mal/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
