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
      tamasfe.even-better-toml
      esbenp.prettier-vscode
      usernamehw.errorlens
      eamodio.gitlens
      yzhang.markdown-all-in-one
      oderwat.indent-rainbow
      denoland.vscode-deno
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "lit-html";
        publisher = "bierner";
        version = "1.11.1";
        sha256 = "sha256-bN786jjTKkcrF0UUOG/J1/k1wqM7JfUO1pQomWLu8+I=";
      }
      {
        name = "better-comments";
        publisher = "aaron-bond";
        version = "3.0.2";
        sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
      }
      {
        name = "Bookmarks";
        publisher = "alefragnani";
        version = "13.4.1";
        sha256 = "sha256-MFr5oePj1gqPXkUi+kvXHhgckw28EAbM48Q3p3oWKCs=";
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
        version = "0.0.40";
        sha256 = "sha256-HFlOig5UUsT+XX0h1dcRQ3mWRsASqvKTMpqqRhVpTAY=";
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
        version = "0.0.14";
        sha256 = "sha256-nCtcTirVoOKa5cuxarqzYXmR7Co0TP+b2XxjAjfOtCo=";
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
