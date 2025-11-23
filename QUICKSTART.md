# 🚀 Quick Start Guide

Guia de referência rápida para começar a desenvolver.

## ⚡ Instalação Rápida

```bash
# Clone e entre no diretório
git clone https://github.com/KPS250/desenvolvimento-hibrido.git
cd desenvolvimento-hibrido

# Instale tudo de uma vez
yarn bootstrap

# Execute o exemplo
cd example
yarn android  # ou yarn ios
```

## 📝 Comandos Essenciais

### Desenvolvimento
```bash
yarn start                 # Iniciar Metro bundler
yarn android              # Executar no Android
yarn ios                  # Executar no iOS (macOS)
yarn test                 # Executar testes
yarn lint                 # Verificar código
yarn typecheck           # Verificar TypeScript
```

### Build
```bash
yarn prepack             # Build do módulo
yarn clean               # Limpar builds
yarn bootstrap           # Reinstalar tudo
```

### Flutter
```bash
cd rn_flutter_sdk
flutter pub get          # Instalar dependências
flutter run              # Executar módulo (debug)
flutter build apk        # Build Android
flutter build ios        # Build iOS
flutter test             # Testes Flutter
```

### Limpeza Completa
```bash
# React Native
watchman watch-del-all
rm -rf node_modules
yarn install
yarn start --reset-cache

# Android
cd example/android
./gradlew clean
cd ../..

# iOS (macOS)
cd example/ios
rm -rf Pods Podfile.lock
pod install
cd ../..

# Flutter
cd rn_flutter_sdk
flutter clean
flutter pub get
cd ..
```

## 🐛 Debug Rápido

### Verificar Ambiente
```bash
flutter doctor -v        # Verificar setup Flutter
node --version          # Verificar Node
yarn --version          # Verificar Yarn
```

### Logs em Tempo Real
```bash
# Android
adb logcat | grep -i "ReactNative"

# iOS (Terminal do Xcode ou)
xcrun simctl spawn booted log stream --level debug
```

### Resetar Tudo
```bash
yarn clean
rm -rf node_modules example/node_modules
yarn install
cd example && yarn install && cd ..
yarn bootstrap
```

## 📱 Dispositivos

### Android
```bash
# Listar dispositivos
adb devices

# Iniciar emulador
emulator -avd Pixel_5_API_31

# Instalar APK manualmente
adb install example/android/app/build/outputs/apk/debug/app-debug.apk
```

### iOS
```bash
# Listar simuladores
xcrun simctl list devices

# Abrir simulador
open -a Simulator
```

## 🔧 Troubleshooting Rápido

| Problema | Solução |
|----------|---------|
| Metro não inicia | `watchman watch-del-all && yarn start --reset-cache` |
| Build falha | `yarn clean && yarn bootstrap` |
| Pods error | `cd ios && rm -rf Pods && pod install` |
| Gradle error | `cd android && ./gradlew clean` |
| Flutter error | `cd rn_flutter_sdk && flutter clean && flutter pub get` |
| TypeScript error | `yarn typecheck` |
| Lint error | `yarn lint --fix` |

## 📚 Documentação

- [README Principal](README.md) - Visão geral completa
- [Instalação Detalhada](INSTALLATION.md) - Setup do ambiente
- [Arquitetura](ARCHITECTURE.md) - Design do projeto
- [Contribuindo](CONTRIBUTING.md) - Como contribuir
- [Changelog](CHANGELOG.md) - Histórico de versões

## 🎯 Estrutura de Pastas

```
src/                      # Seu código TypeScript aqui
android/                  # Código nativo Android
ios/                      # Código nativo iOS
rn_flutter_sdk/lib/      # Código Flutter/Dart
example/src/             # App de exemplo
```

## 💡 Dicas

1. **Sempre** verifique com `flutter doctor` antes de começar
2. **Use** o script `yarn bootstrap` para setup inicial
3. **Execute** `yarn clean` se algo estiver estranho
4. **Mantenha** Flutter e React Native atualizados
5. **Leia** as mensagens de erro - elas geralmente são úteis!

## 🔗 Links Úteis

- [React Native Docs](https://reactnative.dev)
- [Flutter Docs](https://flutter.dev)
- [TypeScript Docs](https://typescriptlang.org)
- [GitHub Issues](https://github.com/KPS250/desenvolvimento-hibrido/issues)

---

**Precisa de ajuda?** Abra uma [issue](https://github.com/KPS250/desenvolvimento-hibrido/issues) ou consulte a documentação completa.

