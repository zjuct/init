#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

# 设置代理
PROXY_CONFIG="$SCRIPT_DIR/../config/proxy"
if [ -f "$PROXY_CONFIG" ]; then
    ALL_PROXY=$(cat "$PROXY_CONFIG")
    export ALL_PROXY
    echo "[INFO] set ALL_PROXY: $ALL_PROXY"
else
    echo "[ERROR] $PROXY_CONFIG not exist"
    exit 1
fi