{ pkgs, ... }: {
  home.stateVersion = "24.05";

  programs.firefox = {
    enable = true;

    profiles.Main = {
      bookmarks = [{
        name = "Toolbar";
        toolbar = true;

        bookmarks = [{
          name = "Proton";

          bookmarks = [
            {
              name = "Blog";
              url = "https://proton.me/blog";
            }
            {
              name = "Drive";
              url = "https://drive.proton.me/u/0";
            }
            {
              name = "Mail";
              url = "https://mail.proton.me/u/0";
            }
            {
              name = "Pass";
              url = "https://pass.proton.me/u/0";
            }
          ];
        }];
      }];

      containers = {
        youtube = {
          id = 0;
          name = "YouTube";
          icon = "fingerprint";
          color = "red";
        };
      };
      containersForce = true;

      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        multi-account-containers
        pay-by-privacy
        proton-pass
        proton-vpn
        return-youtube-dislikes
        sponsorblock
        ublock-origin
        violentmonkey
      ];
    };
  };

  programs.git = {
    enable = true;

    userName = "Abhi Thube";
    userEmail = "athube@abhithube.com";

    extraConfig = { init.defaultBranch = "main"; };
  };

  programs.vscode = {
    enable = true;

    extensions = [
      # pkgs.vscode-extensions.biomejs.biome
      pkgs.vscode-extensions.bradlc.vscode-tailwindcss
      pkgs.vscode-extensions.catppuccin.catppuccin-vsc
      pkgs.vscode-extensions.catppuccin.catppuccin-vsc-icons
      pkgs.vscode-extensions.christian-kohler.path-intellisense
      pkgs.vscode-extensions.continue.continue
      # pkgs.vscode-extensions.donjayamanne.python-environment-manager
      pkgs.vscode-extensions.esbenp.prettier-vscode
      pkgs.vscode-extensions.hashicorp.terraform
      pkgs.vscode-extensions.jnoortheen.nix-ide
      pkgs.vscode-extensions.jock.svg
      # pkgs.vscode-extensions.kevinrose.vsc-python-indent
      pkgs.vscode-extensions.ms-azuretools.vscode-docker
      pkgs.vscode-extensions.ms-python.debugpy
      # pkgs.vscode-extensions.ms-python.python
      pkgs.vscode-extensions.ms-python.vscode-pylance
      # pkgs.vscode-extensions.ms-vscode.remote-explorer
      # pkgs.vscode-extensions.ms-vscode.remote-server
      pkgs.vscode-extensions.ms-vscode-remote.remote-containers
      pkgs.vscode-extensions.ms-vscode-remote.remote-ssh
      pkgs.vscode-extensions.redhat.vscode-xml
      pkgs.vscode-extensions.redhat.vscode-yaml
      # pkgs.vscode-extensions.richie5um2.vscode-sort-json
      pkgs.vscode-extensions.rust-lang.rust-analyzer
      pkgs.vscode-extensions.tamasfe.even-better-toml
      # pkgs.vscode-extensions.tauri-apps.tauri-vscode
      pkgs.vscode-extensions.vscodevim.vim
      # pkgs.vscode-extensions.yoavbls.pretty-ts-errors
    ];

    keybindings = [
      {
        key = "ctrl+r";
        command = "workbench.action.reloadWindow";
      }
      {
        key = "ctrl+r";
        command = "-workbench.action.reloadWindow";
        when = "isDevelopment";
      }
    ];

    userSettings = {
      "[css]"."editor.defaultFormatter" = "vscode.css-language-features";
      "[dockerfile]"."editor.defaultFormatter" = "ms-azuretools.vscode-docker";
      "[html]"."editor.defaultFormatter" = "vscode.html-language-features";
      "[javascript]"."editor.defaultFormatter" = "biomejs.biome";
      "[json]"."editor.defaultFormatter" = "biomejs.biome";
      "[jsonc]"."editor.defaultFormatter" = "biomejs.biome";
      "[rust]"."editor.codeLens" = false;
      "[svg]"."editor.defaultFormatter" = "jock.svg";
      "[typescript]"."editor.defaultFormatter" = "biomejs.biome";
      "[typescriptreact]"."editor.defaultFormatter" = "biomejs.biome";
      "[xml]"."editor.defaultFormatter" = "redhat.vscode-xml";
      "[yaml]"."editor.defaultFormatter" = "redhat.vscode-yaml";
      "continue.enableTabAutocomplete" = true;
      "continue.showInlineTip" = false;
      "continue.telemetryEnabled" = false;
      "diffEditor.ignoreTrimWhitespace" = false;
      "editor.codeActionsOnSave" = {
        "quickfix.biome" = "explicit";
        "source.fixAll" = "explicit";
        "source.organizeImports.biome" = "explicit";
      };
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontLigatures" = true;
      "editor.formatOnSave" = true;
      "editor.inlayHints.enabled" = "off";
      "editor.minimap.enabled" = false;
      "editor.suggest.showWords" = false;
      "editor.tabSize" = 2;
      "git.autofetch" = true;
      "javascript.updateImportsOnFileMove.enabled" = "always";
      "json.format.enable" = false;
      "nix.enableLanguageServer" = true;
      "nix.serverPath" = "nixd";
      "redhat.telemetry.enabled" = false;
      "rust-analyzer.check.command" = "clippy";
      "svg.preview.mode" = "img";
      "telemetry.telemetryLevel" = "off";
      "typescript.updateImportsOnFileMove.enabled" = "always";
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "workbench.tree.indent" = 16;
    };
  };
}
