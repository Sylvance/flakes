{
  description = "A flake for Node.js and Next.js projects.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  };

  outputs = { self, nixpkgs }:
    let
      # Import the Nixpkgs flake
      nixpkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };

      # Define Node.js
      nodejs = nixpkgs.pkgs.nodejs-14_x;
      
      # Define Yarn
      yarn = nixpkgs.pkgs.yarn2;

      # Define Next.js
      nextjs = nixpkgs.pkgs.nodePackages.next;

    in
    {
      packages = {
        nodejs = nodejs;
        yarn = yarn;
        nextjs = nextjs;
      };
    };
}
