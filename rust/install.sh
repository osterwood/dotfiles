#!/bin/bash

# Install Rust with Rustup
# https://www.rustup.rs/

if which rustup > /dev/null; then
  rustup self update
else
  curl https://sh.rustup.rs -sSf | sh -s -- --no-modify-path -y
fi

~/.cargo/bin/rustup install nightly
~/.cargo/bin/rustup default nightly

# install RLS and other components
packages=(
  rls-preview
  rust-analysis
  rust-src
  rustfmt-preview
  llvm-tools-preview
)

~/.cargo/bin/rustup component add "${packages[@]}"
~/.cargo/bin/rustup target add thumbv6m-none-eabi thumbv7m-none-eabi thumbv7em-none-eabi thumbv7em-none-eabihf
~/.cargo/bin/cargo install cargo-binutils cargo-generate

# mkdir '~/.zfunc'
# rustup completions zsh > '~/.zfunc/_rustup'