#!/bin/bash

# Garante que o script execute a partir do diretório onde ele está (example/)
cd "$(dirname "$0")"

export ANDROID_HOME=/Users/jonathasrochadesouza/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools

echo "Configurando ADB Reverse..."
adb reverse tcp:8081 tcp:8081

echo "Tentando desinstalar versão antiga para liberar espaço..."
adb uninstall com.rnloginsdk || true
adb uninstall com.rnloginsdkexample || true

echo "Iniciando Build e Instalação..."
yarn android