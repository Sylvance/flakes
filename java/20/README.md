# Java20

This `flake.nix` file specifies a flake with a single input,
which is the Nixpkgs repository at a specific commit.
It also defines a Java 20 derivation using Nixpkgs and
exposes it as a package named `java20` in the flake's outputs.

To use this flake in a Spring Boot project with Java 20, you
can create a `default.nix` file in the same directory where you
have your project code. Inside `default.nix`, you can reference
the Java 20 package from the flake like this below:

```nix
{
  description = "My Spring Boot project with Java 20";

  inputs = {
    flake-java = {
      url = "https://github.com/Sylvance/flakes/tree/main/java/20";
      inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
      };
    };
  };

  outputs = { self, flake-java, nixpkgs }:
    let
      # Import the flake's outputs
      java20 = flake-java.outputs.packages.java20;

      # Define your project-specific attributes here
      # For example:
      mySpringBootApp = { ... };
    in
    {
      packages = {
        java20 = java20;
        mySpringBootApp = mySpringBootApp;
      };
    };
}
```

In this default.nix, we reference the Java 20 package
from the flake and can add any additional attributes
or packages specific to your Spring Boot project.

You can then use `nix develop` or `nix shell` to enter an
environment with Java 20 and your project-specific dependencies:

```shell
nix develop
```

This setup allows you to work on your Spring Boot project
with Java 20 using Nix for dependency management.
