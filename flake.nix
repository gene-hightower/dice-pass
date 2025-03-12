{
  description = "A Diceware style pass{word,phrase} generator.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
    systems.url = "github:nix-systems/default";
  };

  outputs = { self, systems, nixpkgs }@inputs:
    let
      importNixpkgs = system: import nixpkgs {
        inherit system;
      };
      systems = import inputs.systems;
      withSystemPackages = f: nixpkgs.lib.genAttrs systems (system: f (importNixpkgs system));
    in
    {
      packages = withSystemPackages (pkgs: {
        default = pkgs.callPackage ./package.nix { };
      });
    };
}