{
  description = "Hugo framework development environment.";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShell = pkgs.mkShell {
        packages = with pkgs; [
          hugo
          just
        ];
        shellHook = ''
          echo "🌏 wesleyjrz.com"
        '';
      };
    });
}
