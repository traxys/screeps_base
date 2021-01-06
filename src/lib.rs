use wasm_bindgen::prelude::*;
use web_sys::console;

#[wasm_bindgen(js_name = loop)]
pub fn game_loop() {
    console::log_1(&format!("Hello from bindgen!, with a script!").into());
}
