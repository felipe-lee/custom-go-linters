# to install
# nix-env -p /nix/var/nix/profiles/mymove -f nix -i
#
# use
#
# https://lazamar.co.uk/nix-versions/
# to find rev for specific package version

let
  pkgs = import <nixpkgs> {};
  inherit (pkgs) buildEnv;
in buildEnv {
  name = "mymove-packages";
  paths = [

    (import (builtins.fetchGit {
      # Descriptive name to make the store path easier to identify
      name = "go-1.15.15";
      url = "https://github.com/NixOS/nixpkgs/";
      ref = "refs/heads/master";
      rev = "9a0676dc4866128463c4cd83a20ad10384d6824f";
    }) {}).go

    (import (builtins.fetchGit {
      # Descriptive name to make the store path easier to identify
      name = "pre-commit-2.15.0";
      url = "https://github.com/NixOS/nixpkgs/";
      ref = "refs/heads/master";
      rev = "d73f18c222d3a21e536448cbecd33bba8142b2c1";
    }) {}).pre-commit

  ];
}
