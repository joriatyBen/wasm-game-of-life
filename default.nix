
# THIS is not working - dont know
{ pkgs ? import <nixpkgs> {} }:
with pkgs; 

let
  unstable = import (fetchTarball https://nixos.org/channels/nixos-unstable/nixexprs.tar.xz) { };
in

mkShell {
  buildInputs = with pkgs; [
    pkg-config
    llvmPackages.clang-unwrapped
    llvmPackages.bintools #lld
    wasm-pack
    #rustc
    rustc-wasm32 #to get rid of rustc twerks
    unstable.cargo
    openssl
    #rustup
    rustfmt
    nodejs_21
    yarn
    nodePackages.typescript
    nodePackages.prettier
    nodePackages.eslint
    libelf
    cmake
    libiconv
    zlib
    rustup
  ];
  

  PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  RUST_SRC_PATH = "${rust.packages.stable.rustPlatform.rustLibSrc}";

  LIBCLANG_PATH = pkgs.lib.makeLibraryPath [ pkgs.llvmPackages_latest.libclang.lib ];
  #RUSTFLAGS="-C linker=lld";
  CARGO_TARGET_WASM32_UNKNOWN_UNKNOWN_LINKER = "wasm-ld";
  #RUST_BACKTRACE = 1;
  #CC ="clang";
  #CARGO_TARGET_X86_64_UNKNOWN_LINUX_GNU_LINKER = "gcc";

  shellHook = ''
    exec zsh
    '';
  }
