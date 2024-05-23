#### rustwasm
[tutorial](https://rustwasm.github.io/book/)

##### setup
1. run `cargo-install wasm-pack` or add it with flake.nix
2. `nix develop .`
3. add to path `PATH=$PATH:~/.cargo/bin` to run installed binaries
4. cargo-generate: `cargo install cargo-generate`
5. npm to use JavaScript bundler and dev server: `npm install npm@latest -g`
6. build project: `wasm-pack build`

##### stuff
[the wasm-bindgen guide](https://rustwasm.github.io/wasm-bindgen/) to facilitate high-level interactions between wasm 
modules and JS

