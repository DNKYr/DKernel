{ pkgs ? import <nixpkgs> { } }:

pkgs.mkShell {
  nativeBuildInputs =
    with pkgs; [
      pkgsCross.i686-embedded.buildPackages.gcc
      qemu
      nasm
      grub2 # grub-file: check that the kernel has a valid Multiboot header
      xorriso
    ];

  CLANGD_FLAGS = "--query-driver=/nix/store/*i686-elf*/bin/i686-elf-*";
}

