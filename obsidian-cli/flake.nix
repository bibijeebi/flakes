{
  description = "CLI tool for Obsidian";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.buildGoModule {
          pname = "obsidian-cli";
          version = "0.1.8";

          src = pkgs.fetchFromGitHub {
            owner = "Yakitrak";
            repo = "obsidian-cli";
            rev = "v0.1.8";
            sha256 = "sha256-W3QdWklO39W0wI1kt2M14QYmcc8AqxhqXROctMV4zQU="; # Replace with actual hash
          };

          vendorHash = null;

          meta = with pkgs.lib; {
            description = "CLI tool for Obsidian";
            homepage = "https://github.com/Yakitrak/obsidian-cli";
            license = licenses.mit;
            maintainers = [];
          };
        };
      }
    );
}
