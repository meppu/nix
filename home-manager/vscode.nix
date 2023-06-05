{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      {
        name = "Nix";
        publisher = "bbenoist";
        version = "1.0.1";
        sha256 = "qwxqOGublQeVP2qrLF94ndX/Be9oZOn+ZMCFX1yyoH0=";
      }
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
        name = "elixir-ls";
        publisher = "JakeBecker";
        version = "0.14.7";
        sha256 = "RkwgQqasBKMA+0293QhbZhgyGSqhJSic5DuIpBB+OEA=";
      }
      {
        name = "LiveServer";
        publisher = "ritwickdey";
        version = "5.7.9";
        sha256 = "w0CYSEOdltwMFzm5ZhOxSrxqQ1y4+gLfB8L+EFFgzDc=";
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
      {
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.1540";
        sha256 = "prRGT483TgcWP0FSX3Fxw6c15gTP2kFlSJUkO/BvCM0=";
      }
      {
        name = "crates";
        publisher = "serayuzgur";
        version = "0.5.11";
        sha256 = "CuUc68SRJWbnChLJjHqZwPbzptxG85qHJ53IrAZc2zc=";
      }
      {
        name = "better-toml";
        publisher = "bungcip";
        version = "0.3.2";
        sha256 = "g+LfgjAnSuSj/nSmlPdB0t29kqTmegZB5B1cYzP8kCI=";
      }
    ];
  };
}
