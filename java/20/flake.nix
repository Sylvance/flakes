{
  description = "A flake for Java 20.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  };

  outputs = { self, nixpkgs }:
    let
      # Import the Nixpkgs flake
      nixpkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };

      # Define the Java 20 derivation
      java20 = nixpkgs.pkgs.jdkPackages.openjdk20;
    in
    {
      packages = {
        java20 = java20;
      };
    };
}
