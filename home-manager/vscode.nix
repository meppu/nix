{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      jakebecker.elixir-ls
      ritwickdey.liveserver
      rust-lang.rust-analyzer
      serayuzgur.crates
      bungcip.better-toml
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.3.2";
        sha256 = "szG/Fm86RWWNITIYNvCQmEv8tx2VCAxtkXyQrb7Wsn4=";
      }
      {
        name = "erlang";
        publisher = "pgourlain";
        version = "0.9.3";
        sha256 = "9aMkAAx88iJg5R8OKXTyiTZ6N/jJNHM9pBrUA6+e9JE=";
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
        version = "0.0.11";
        sha256 = "I8EAcR2k7m5pNncxStEhF+1P10TfRARcSQ+ugekIRak=";
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
