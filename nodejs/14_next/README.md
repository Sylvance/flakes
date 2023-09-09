# Nodejs 14 | Nextjs

This `flake.nix` file specifies a flake with a single input,
which is the Nixpkgs repository at a specific commit.
It also defines Nodejs 14 and Nextjs derivations using Nixpkgs
and exposes them as packages named `nodejs`, `yarn` and `nextjs` in the Flake's outputs.

To use this Flake to work on a Nextjs project with Nodejs 14,
create a `default.nix` file in your project directory and reference the
Nodejs 14 and Nextjs packages from the flake like this below:

```nix
{
  description = "My Next.js project with Node.js";

  inputs = {
    flake-nodejs = {
      url = "https://github.com/Sylvance/flakes/tree/main/nodejs/14_next";
      inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
      };
    };
  };

  outputs = { self, flake-nodejs, nixpkgs }:
    let
      # Import the flake's outputs
      nodejs = flake-nodejs.outputs.packages.nodejs;
      yarn = flake-nodejs.outputs.packages.yarn;
      nextjs = flake-nodejs.outputs.packages.nextjs;

      # Define your Next.js project attributes here
      # For example:
      myNextjsApp = { ... };
    in
    {
      packages = {
        nodejs = nodejs;
        yarn = yarn;
        nextjs = nextjs;
        myNextjsApp = myNextjsApp;
      };
    };
}
```

In this `default.nix`, we reference Nodejs 14 and Nextjs
packages from the Flake and can add any additional attributes
or packages specific to your Nextjs project.

You can then use `nix develop` or `nix shell` to enter an
environment with Nodejs 14 and Nextjs for your project:

```shell
nix develop
```

This setup allows you to work on your Nextjs project with Nodejs 14
using Nix for dependency management.
