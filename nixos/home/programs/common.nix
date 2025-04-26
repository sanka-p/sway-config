{
    pkgs,
    config,
    ...
}: {
    home.packages = with pkgs; [
      gcc
      gnumake
      nodejs
      vscode # TODO: Remove
      jdk21
      iverilog
      gtkwave
      anydesk
    ];

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
    #xdg.configFile.nvim.source = ./nvim;
    home.file = {
      ".config/nvim" = {
        # TODO: Isn't there a better way to create the symlink 
        source = config.lib.file.mkOutOfStoreSymlink "/home/sanka/dev/dotfiles/nvim";
      };
    };
}
