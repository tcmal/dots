# Status bar, displayed in lower right

{ ... }:

{
    enable = true;
    enableDefault = false;

    modules = {
        "tztime local" = {
            position = 1;
            settings = {
                format = "%H:%M";
            };
        };
    };
}