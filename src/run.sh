#!/usr/bin/env bash
set -Ceu
#---------------------------------------------------------------------------
# テンプレートエンジンCLIツールkamidanaをインストールする。
# CreatedAt: 2021-07-15
#---------------------------------------------------------------------------
Run() {
	THIS="$(realpath "${BASH_SOURCE:-0}")"; HERE="$(dirname "$THIS")"; PARENT="$(dirname "$HERE")"; THIS_NAME="$(basename "$THIS")"; APP_ROOT="$PARENT";
	cd "$HERE"
	IsExistCmd() { type "$1" > /dev/null 2>&1; }
	InstallTera() { cargo install --git https://github.com/chevdor/tera-cli; }
	InstallKamidana() { pip3 install kamidana; pip3 install qtoml; }
	IsExistCmd kamidana || InstallKamidana
	
	cd ./0
	rm -f README.md
	kamidana README.tpl -d README.tpl.toml > README.md
	cd ../1
	rm -f README.md
	kamidana README.tpl -d README.tpl.toml > README.md
}
Run "$@"
