{ ... }:

{
  services.ssh-agent.enable = true;

  programs.git = {
    enable = true;
    settings = {
      user.email = "hey.mukesh272921@gmail.com";
      user.name = "Mukesh";
      init.defaultBranch = "main";
      core.editor = "nano";
    };
  };
}
