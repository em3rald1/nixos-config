{
  mkUser = { username, extraGroups ? [], home ? username}: {
    ${username} = {
      inherit extraGroups;
      home = "/home/${home}";
      description = "A user created via mkUser utility function";
      isNormalUser = true;
    };
  };

  mkGroup = { name }: {
    ${name} = {
      inherit name;
    };
  };
}
