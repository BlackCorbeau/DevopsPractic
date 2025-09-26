{ pkgs ? import <nixpkgs> {} }:
let
  pypkgs = pkgs.python3Packages;
in
pkgs.mkShell {
  name = "codrs.ru";

  buildInputs = with pypkgs; [
    python
    virtualenv
  ];

  shellHook = ''
    if [ ! -d "pyenv" ]; then
      python -m venv .pyenv
    fi

    source .pyenv/bin/activate

    if [ -f "requirements.txt" ]; then
      pip install -r requirements.txt
    fi
  '';
}
