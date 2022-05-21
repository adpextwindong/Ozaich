{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; with haskellPackages; [
    haskell.compiler.ghc8107
    cabal-install
    souffle
  ];
}
