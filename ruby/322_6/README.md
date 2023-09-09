# Ruby 3.2.2 | Rails 6

This `flake.nix` file specifies a flake with a single input,
which is the Nixpkgs repository at a specific commit.
It also defines Ruby 3.2.2 and Rails 6 derivations using Nixpkgs
and exposes them as packages named `ruby322` and `rails6` in the Flake's outputs.

To use this Flake to work on a Rails 6 project with Ruby 3.2.2,
create a `default.nix` file in your project directory and reference the
Ruby and Rails packages from the flake like this below:

```nix
{
  description = "My Rails 6 project with Ruby 3.2.2";

  inputs = {
    flake-ruby = {
      url = "https://github.com/Sylvance/flakes/tree/main/ruby/322_6";
      inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
      };
    };
  };

  outputs = { self, flake-ruby, nixpkgs }:
    let
      # Import the flake's outputs
      ruby322 = flake-ruby.outputs.packages.ruby322;
      rails6 = flake-ruby.outputs.packages.rails6;

      # Define your Rails 6 project attributes here
      # For example:
      myRails6App = { ... };
    in
    {
      packages = {
        ruby322 = ruby322;
        rails6 = rails6;
        myRails6App = myRails6App;
      };
    };
}
```

In this `default.nix`, we reference Ruby 3.2.2 and Rails 6
packages from the Flake and can add any additional attributes
or packages specific to your Rails 6 project.

You can then use `nix develop` or `nix shell` to enter an
environment with Ruby 3.2.2 and Rails 6 for your project:

```shell
nix develop
```

This setup allows you to work on your Rails 6 project with Ruby 3.2.2
using Nix for dependency management.
