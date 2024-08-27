{ pkgs, ... }: {
  home.stateVersion = "24.05";

  programs.git = {
    enable = true;

    userName = "Abhi Thube";
    userEmail = "athube@abhithube.com";

    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
