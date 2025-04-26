{ 
    config, 
    pkgs, 
    ... 
}: {
    
    programs.sway = {
        enable = true;
        # wrapperFeatures.gtk = true;
        extraPackages =  with pkgs; [ brightnessctl foot grim pulseaudio swayidle swaylock wmenu ];
    };

}