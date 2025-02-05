{
  description = "Collection of Nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    
    # Add sub-flakes here
    obsidian-cli = {
      url = "path:./obsidian-cli";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Additional sub-flakes will be added here as they are created
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        # Expose packages from all sub-flakes
        packages = {
          obsidian-cli = inputs.obsidian-cli.packages.${system}.default;
          # Additional packages will be added here
        };

        # Expose a merged set of all sub-flake packages as the default
        defaultPackage = pkgs.symlinkJoin {
          name = "all-packages";
          paths = with self.packages.${system}; [
            obsidian-cli
            # Additional packages will be added here
          ];
        };
      }
    ) // {
      # Add any system-independent outputs here if needed
    };
}