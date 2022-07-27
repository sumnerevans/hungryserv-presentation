let
  pkgs = import <nixpkgs> { };

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
