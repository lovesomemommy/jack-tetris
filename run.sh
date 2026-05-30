#!/usr/bin/env bash
set -e
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
NAND2TETRIS="${NAND2TETRIS:-$HOME/Desktop/nand2tetris}"
TOOLS="$NAND2TETRIS/tools"
SRC="$SCRIPT_DIR/src"
VM="$SCRIPT_DIR/vm"

chmod +x "$TOOLS/JackCompiler.sh" "$TOOLS/VMEmulator.sh"
echo "==> Compile Jack Tetris..."
"$TOOLS/JackCompiler.sh" "$SRC"
mkdir -p "$VM"
cp "$SRC"/*.vm "$VM/"
cp "$TOOLS/OS"/*.vm "$VM/"
echo "==> Done. Open in VM Emulator: $VM"
echo "    Run -> Go (F5), Animate -> None"
"$TOOLS/VMEmulator.sh" &
