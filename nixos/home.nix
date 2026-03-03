{
  config,
  pkgs,
  lib,
  options,
  ...
}:
{
  home = {
    username = "irisrad";
    homeDirectory = "/home/irisrad";
    packages = with pkgs; [
      nixfmt
      zsh-fzf-tab
      neofetch
      slack
      zoom
    ];
    sessionVariables = {
      EDITOR = "hx";
      LESS = "-iR";
      TERM = "alacritty";
    };
    stateVersion = "25.11";
  };
  programs = {
    zsh = {
      enable = true;
      plugins = [
        {
          name = "fzf-tab";
          src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
        }
      ];
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "vi-mode"
        ];
        theme = "robbyrussell";
      };
      defaultKeymap = "viins";
      initContent = lib.mkOrder 1500 ''
        bindkey -M viins 'jk' vi-cmd-mode
      '';
    };
    fzf = {
      enable = true;
      defaultCommand = "rg --files --hidden";
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "iris";
          email = "irisrad@pdx.edu";
        };
        init = {
          defaultBranch = "main";
        };
      };
    };
    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 13;
            y = 13;
          };
        };
        font = {
          size = 12.5;
          builtin_box_drawing = false;
        };
        cursor = {
          style = {
            shape = "Beam";
          };
        };
      };
    };
    helix = {
      enable = true;
      settings = {
        theme = "snale";
        editor = {
          shell = [
            "zsh"
            "-c"
          ];
          bufferline = "always";
          color-modes = true;
          text-width = 80;
          cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "block";
          };
          file-picker = {
            hidden = false;
          };
          soft-wrap = {
            enable = true;
            wrap-at-text-width = true;
          };
        };
        keys = {
          insert = {
            j = {
              k = "normal_mode";
            };
          };
        };
      };
    };
    ripgrep = {
      enable = true;
    };
    firefox = {
      enable = true;
    };
  };
}
