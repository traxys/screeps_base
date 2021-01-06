#!/bin/sh

NAME="$(echo "{{project-name}}" | sed -e 's/\-/\_/')"
OUTPUT_DIR=""

if [ $OUTPUT_DIR -z ]; then
	echo "You must specify the OUTPUT_DIR"
	exit 1
fi

wasm-pack build --target nodejs

mkdir -p build
cp pkg/"$NAME.js" build/main.js
cp pkg/"$NAME"_bg.wasm build/compiled.wasm

TEXT_ENCODER="const { TextDecoder } = require(String.raw\`util\`);"
TEXT_ENCODER_LINE="$(grep -n "$TEXT_ENCODER" build/main.js | cut -d":" -f1)"

START="$(head -n "$(($TEXT_ENCODER_LINE - 1))" build/main.js)"
END="$(tail -n +"$(($TEXT_ENCODER_LINE + 1))" build/main.js)"
printf "$START\n$(cat ressources/text_encoder.js)$END" > build/main.js

REQUIRE="const path = require('path').join(__dirname,"
REQUIRE_LINE="$(grep -n "$REQUIRE" build/main.js | cut -d":" -f1)"

START="$(head -n "$(($REQUIRE_LINE - 1))" build/main.js)"
END="$(tail -n +"$(($REQUIRE_LINE + 2))" build/main.js)"
printf "$START\nconst bytes = require('compiled');\n$END" > build/main.js

cp build/* "$OUTPUT_DIR"
