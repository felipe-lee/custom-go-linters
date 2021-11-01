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
      name = "go-1.17.2";
      url = "https://github.com/NixOS/nixpkgs/";
      # Using master branch since 1.17.2 hasn't made it to nixpkgs-unstable yet
      ref = "refs/heads/master";
      rev = "db3aa421df73f43c03ad266619e22ce7c5354d92";
    }) {}).go_1_17

    (import (builtins.fetchGit {
      # Descriptive name to make the store path easier to identify
      name = "pre-commit-2.14.0";
      url = "https://github.com/NixOS/nixpkgs/";
      ref = "refs/heads/nixpkgs-unstable";
      rev = "229ff549e611d33d6b8ef2c6a2ce8879e9e75545";
    }) {}).pre-commit

  ];
}
