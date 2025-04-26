{
    pkgs,
    config,
    ...
}: {
    programs.kitty = {
        enable = true;
#        font = {
#          name = "JetBrainsMono Nerd Font";
#          size = 10;
#        };
#        environment = {};
#        settings = {
#            # Bless the ears
#            enable_audio_bell = false;
#
#            # Window styles
#            window_border_width = "0.5pt";
#            draw_minimal_borders = true;
#            window_margin_width = 1;
#            hide_window_decorations = true;
#
#            # Tab Bar
#            tab_bar_min_tabs            = 2;
#            tab_bar_edge                = "bottom";
#            tab_bar_style               = "powerline";
#            tab_powerline_style         = "slanted";
#            tab_title_template          = "{activity_symbol} {index} {tab.active_exe}";
#            #tab_bar_margin_height       = 0.0 0.4; #TODO
#        };
#        confirm_os_window_close = false;
#        #shellIntegration.enableFishIntegration = true;
#        theme = "Catppuccin-Macchiato";
#        #Also available: Catppuccin-Frappe Catppuccin-Latte Catppuccin-Macchiato Catppuccin-Mocha
#        # See all available kitty themes at: https://github.com/kovidgoyal/kitty-themes/blob/46d9dfe230f315a6a0c62f4687f6b3da20fd05e4/themes.json
    };

}
