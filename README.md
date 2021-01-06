# Rust Screeps basic template
This is the most basic template you can have to use rust in `screeps`. Most of the work was taken from what was done in [screeps-game-api](https://github.com/rustyscreeps/screeps-game-api/blob/bindgen/bindgen-notes-temp.md)

This adds a `copy.sh` script that calls `wasm-pack`, modifies the output so that it can be deployed in `screeps` and copies that to the `OUTPUT_DIR`. You need to set that dir in `copy.sh`

You can clone this template with `cargo generate --git https://github.com/traxys/screeps_base`
