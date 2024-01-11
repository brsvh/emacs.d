{ inputs
, ...
}:
{
  imports = [
    inputs.treefmt.flakeModule
  ];
  perSystem = { ... }: {
    treefmt = {
      flakeFormatter = true;
      projectRootFile = "flake.nix";

      programs = {
        nixpkgs-fmt = {
          enable = true;
        };

        shellcheck = {
          enable = true;
        };

        shfmt = {
          enable = true;
        };
      };

      settings = {
        global = {
          excludes =
            [
              "elpa/**"
            ];
        };
      };
    };
  };
}
