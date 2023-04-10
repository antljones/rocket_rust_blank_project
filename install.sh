#!/bin/bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"
cd ..
cargo new binary_project --bin
cd binary_project
echo 'rocket = { version = "0.5.0-rc.3", features = ["secrets"] }' >> Cargo.toml
cd src
rm main.rs
cd ../..
cp rocket_rust_blank_project/main.rs binary_project/src/
cp -R rocket_rust_blank_project/static binary_project/src/
cd binary_project
cargo run
