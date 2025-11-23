#!/bin/bash
cd "$(dirname "$0")"
echo "Limpando build Android..."
cd android
./gradlew clean
echo "Limpeza concluída!"