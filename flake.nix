{
  description = "Hugo framework development environment.";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = pkgs.mkShell {
          name = "hugo";
          packages = with pkgs; [
            hugo
          ];
          shellHook = ''
            echo "🌏 Hugo Development Environment."

            ./preview.sh --start
          '';
        };
      });
}
