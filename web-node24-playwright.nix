let
    pkgs = import <nixpkgs> {};
in
pkgs.mkShellNoCC {
    packages = with pkgs; [
        nodejs_24
        pnpm
        playwright
    ];

    shellHook = ''
        echo "NOTE: This hasn't been fully tested yet, use at your own risk :)"
        export PLAYWRIGHT_BROWSERS_PATH=${pkgs.playwright.browsers}
        export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true
    '';
}
