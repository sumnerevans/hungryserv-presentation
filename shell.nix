let
  pkgs = import <nixpkgs> {
    # https://github.com/NixOS/nixpkgs/pull/187039
    overlays = [
      (self: super: {
        biber = super.biber.overrideAttrs (old: {
          patches = [
            # Perl 5.36.0 compatibility: https://github.com/plk/biber/pull/411
            (super.fetchpatch {
              url = "https://github.com/plk/biber/commit/d9e961710074d266ad6bdf395c98868d91952088.patch";
              sha256 = "08fx7mvq78ndnj59xv3crncih7a8201rr31367kphysz2msjbj52";
            })
          ];
        });
      })
    ];
  };

  # CoC Config
  cocConfig = pkgs.writeText "coc-settings.json" (
    builtins.toJSON {
      "texlab.path" = "${pkgs.texlab}/bin/texlab";
    }
  );

  PROJECT_ROOT = builtins.getEnv "PWD";
in
with pkgs;
mkShell {
  name = "impurePythonEnv";
  venvDir = "./.venv";

  # https://e.printstacktrace.blog/merging-json-files-recursively-in-the-command-line/
  postShellHook = ''
    # allow pip to install wheels
    unset SOURCE_DATE_EPOCH

    mkdir -p .vim
    ln -sf ${cocConfig} ${PROJECT_ROOT}/.vim/coc-settings.json

    # Add /bin to path
    export PATH="${PROJECT_ROOT}/bin:$PATH"
  '';

  buildInputs = [
    python3
    python3Packages.venvShellHook

    # Core
    gnumake
    neovim
    ripgrep
    rnix-lsp

    # LaTeX
    python3Packages.pygments
    texlive.combined.scheme-full
  ];

  # Run this command, only after creating the virtual environment
  postVenvCreation = ''
    unset SOURCE_DATE_EPOCH
  '';
}
