{
  inputs = {
    utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, utils }: utils.lib.eachDefaultSystem (system: 
    let
      pkgs = nixpkgs.legacyPackages.${system};
      
      # Compilers, linkers & dependency finding programs
      dependencies = with pkgs; [
         pkg-config
         elmPackages.elm
      ];
      
      # Build dependencies
      libraries = with pkgs; [
      ];
      
    in
    {
      devShell = pkgs.mkShell {
        nativeBuildInputs = dependencies;
        buildInputs       = libraries;
        LD_LIBRARY_PATH   = pkgs.lib.makeLibraryPath libraries;
      };
    }
  );
}
