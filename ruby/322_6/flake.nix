{
  description = "A flake for Ruby 3.2.2, Bundler 2.4.13 and Rails 6 projects.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-21.05";
  };

  outputs = { self, nixpkgs }:
    let
      # Import the Nixpkgs flake
      nixpkgs = import inputs.nixpkgs {
        system = "x86_64-linux";
      };

      # Define the Ruby 3.2.2 derivation
      ruby322 = nixpkgs.pkgs.ruby_3_2_2;

      # Define Rails 6
      rails6 = nixpkgs.pkgs.rubyPackages.rails_6;

      # Define Bundler 2.4.13
      bundler = nixpkgs.pkgs.rubyPackages.bundler_2_4_13;

    in
    {
      packages = {
        ruby322 = ruby322;
        rails6 = rails6;
        bundler = bundler;
      };
    };
}
