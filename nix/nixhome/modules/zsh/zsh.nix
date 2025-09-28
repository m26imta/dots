# modules/zsh/zsh.nix
{ config, pkgs, lib, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra = ''
    [[ -f "$HOME/.mybashrc" ]] && source $HOME/.mybashrc
    '';
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    # Environment variables
    sessionVariables = {
      EDITOR = "vim";
      # EDITOR = "nvim";
      # BROWSER = "firefox";
      # TERMINAL = "alacritty";
    };

    initContent = ''
    [[ -f "$HOME/.mybashrc" ]] && source $HOME/.mybashrc
    '';


    # Oh My Zsh configuration (optional)
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        # "sudo"
        # "docker"
        # "kubectl"
        # "systemd"
        # "z"
        # "colored-man-pages"
        # "command-not-found"
      ];
      # theme = "robbyrussell"; # You can change this to your preferred theme
      theme = "eastwood"; # You can change this to your preferred theme
    };
  };

  # Additional packages that work well with zsh
  home.packages = with pkgs; [
    # zsh
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
    nix-zsh-completions

    # Modern CLI tools
    bat          # Better cat
    eza          # Better ls
    fd           # Better find
    ripgrep      # Better grep
    fzf          # Fuzzy finder
    tree         # Directory tree
    htop         # Process viewer
    neofetch     # System info
    tmux

    # Development tools
    git
    curl
    wget
    jq           # JSON processor

    # Archive tools
    unzip
    p7zip
  ];

}
