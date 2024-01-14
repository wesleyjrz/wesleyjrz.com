{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    hugo
  ];

  shellHook = ''
    ./preview.sh --start
  '';
}
