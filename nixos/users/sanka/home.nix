{
    pkgs, 
    ...
}: {
  imports = [
    ../../home/default.nix

    ../../home/programs
    ../../home/shell
    ../../home/sway
  ];

  programs.git = {
    userName = "Sanka Peeris";
    userEmail = "sankapeeris360@gmail.com";
  };
}