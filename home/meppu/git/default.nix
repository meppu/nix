{ ... }:

{
  programs.git = {
    enable = true;
    userName  = "meppu";
    userEmail = "meppu@proton.me";

    extraConfig = {
      init.defaultBranch = "main";
      core.editor = "code --wait";

      gpg = {
        format = "ssh";
        ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      };

      commit.gpgsign = true;
      user.signingkey = "~/.ssh/id_rsa.pub";
    };
  };
}
