{ pkgs, ... }:

let
  user-config = builtins.fromJSON (builtins.readFile ./config.json);
in
{
  programs.vscode = {
    enable = true;
    userSettings = user-config;

    extensions = (with pkgs.vscode-extensions; [
      bbenoist.nix
      jakebecker.elixir-ls
      ritwickdey.liveserver
      rust-lang.rust-analyzer
      serayuzgur.crates
      bungcip.better-toml
      esbenp.prettier-vscode
      usernamehw.errorlens
      eamodio.gitlens
      yzhang.markdown-all-in-one
      oderwat.indent-rainbow
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "3.0.2";
        sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
      }
      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.3.1";
        sha256 = "sha256-CZSFprI8HMQvc8P9ZH+m0j9J6kqmSJM1/Ik24ghif2A=";
      } 
      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.4.2";
        sha256 = "sha256-25ZBVrZ5HEoe5EllvaS8WYUcbO5vqcscEU2bYBuNpkw=";
      }
      {
        name = "erlang-ls";
        publisher = "erlang-ls";
        version = "0.0.39";
        sha256 = "sha256-R0+NvUw+qQRSD8F9L5bS/AqxCMwoPTYYIfb4L+rxduc=";
      }
      {
        name = "min-theme";
        publisher = "miguelsolorio";
        version = "1.5.0";
        sha256 = "DF/9OlWmjmnZNRBs2hk0qEWN38RcgacdVl9e75N8ZMY=";
      }
      {
        name = "symbols";
        publisher = "miguelsolorio";
        version = "0.0.12";
        sha256 = "sha256-eZ/lVoH99ZQA0Xoke941HSuDm6c5JF3owrAvv0uYVK4=";
      }
      {
        name = "fluent-icons";
        publisher = "miguelsolorio";
        version = "0.0.18";
        sha256 = "sE0A441QPwokBoLoCqtImDHmlAXd66fj8zsJR7Ci+Qs=";
      }
    ];
  };
}
