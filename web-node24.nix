let
    pkgs = import <nixpkgs> {};
in
pkgs.mkShellNoCC {
    packages = with pkgs; [
        nodejs_24
        pnpm
    ];
}
