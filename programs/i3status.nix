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