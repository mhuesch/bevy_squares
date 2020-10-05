let
  sources = import ./nix/sources.nix;
  rust = import ./nix/rust.nix { inherit sources; };
in

{ pkgs ? import sources.nixpkgs { config.allowUnfree = true; }
}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    rust

    alsaLib
    gcc-unwrapped.lib
    libudev
    lutris
    pkgconfig
    vulkan-headers
    vulkan-loader
    vulkan-tools
    vulkan-validation-layers
    x11
    xorg.libXcursor
    xorg.libXi
    xorg.libXrandr
  ];
}
