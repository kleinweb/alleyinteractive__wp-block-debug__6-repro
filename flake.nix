# SPDX-FileCopyrightText: 2024-2025 Temple University <kleinweb@temple.edu>
# SPDX-License-Identifier: GPL-3.0-or-later
{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs.follows = "nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
        "aarch64-linux"
      ];

      perSystem =
        { pkgs, system, ... }:
        {
          devShells.default = pkgs.mkShellNoCC {
            nativeBuildInputs = [
              pkgs.php82
              pkgs.php.packages.composer
              pkgs.wp-cli
            ];
          };
        };
    };
}
