# 📦 Guia de Instalação Detalhado

Este guia fornece instruções passo a passo para configurar o ambiente de desenvolvimento e executar o projeto.

## 📋 Índice

1. [Configuração do Ambiente](#1-configuração-do-ambiente)
2. [Instalação de Ferramentas](#2-instalação-de-ferramentas)
3. [Configuração do Projeto](#3-configuração-do-projeto)
4. [Problemas Comuns](#4-problemas-comuns)

---

## 1. Configuração do Ambiente

### 1.1 Node.js e Yarn

#### macOS (via Homebrew)
```bash
# Instalar Homebrew (se ainda não tiver)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Instalar Node.js
brew install node@16

# Instalar Yarn
brew install yarn

# Verificar instalação
node --version  # deve ser >= 16.0.0
yarn --version  # deve ser >= 1.22.15
```

#### Linux (Ubuntu/Debian)
```bash
# Instalar Node.js via NodeSource
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt-get install -y nodejs

# Instalar Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```

#### Windows
```powershell
# Via Chocolatey
choco install nodejs-lts
choco install yarn

# Ou baixe os instaladores:
# Node.js: https://nodejs.org/
# Yarn: https://classic.yarnpkg.com/en/docs/install/#windows-stable
```

### 1.2 Watchman (Recomendado)

#### macOS
```bash
brew install watchman
```

#### Linux
```bash
# Compilar do código-fonte
git clone https://github.com/facebook/watchman.git
cd watchman
./autogen.sh
./configure
make
sudo make install
```

### 1.3 Flutter SDK

#### Todos os Sistemas Operacionais

1. **Baixar Flutter:**
   - Acesse: https://docs.flutter.dev/get-started/install
   - Baixe o SDK para seu SO

2. **Extrair e Configurar:**
   ```bash
   # macOS/Linux
   cd ~
   unzip ~/Downloads/flutter_*.zip
   export PATH="$PATH:`pwd`/flutter/bin"
   
   # Adicione ao seu .bashrc, .zshrc, ou .profile:
   export PATH="$PATH:$HOME/flutter/bin"
   ```

3. **Verificar Instalação:**
   ```bash
   flutter doctor
   ```

### 1.4 Android Studio e SDK

1. **Instalar Android Studio:**
   - Baixe de: https://developer.android.com/studio
   - Instale normalmente

2. **Configurar Android SDK:**
   ```bash
   # Abra Android Studio
   # Configure > SDK Manager
   # Instale:
   # - Android SDK Platform 31 (ou superior)
   # - Android SDK Build-Tools
   # - Android SDK Command-line Tools
   # - Android Emulator
   ```

3. **Configurar Variáveis de Ambiente:**
   ```bash
   # macOS/Linux - Adicione ao .bashrc/.zshrc:
   export ANDROID_HOME=$HOME/Library/Android/sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/tools
   export PATH=$PATH:$ANDROID_HOME/tools/bin
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   
   # Aplicar mudanças:
   source ~/.zshrc  # ou ~/.bashrc
   ```

4. **Aceitar Licenças:**
   ```bash
   flutter doctor --android-licenses
   ```

### 1.5 Xcode (somente macOS)

1. **Instalar Xcode:**
   ```bash
   # Via App Store ou:
   xcode-select --install
   ```

2. **Configurar Command Line Tools:**
   ```bash
   sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
   sudo xcodebuild -runFirstLaunch
   ```

3. **Aceitar Licença:**
   ```bash
   sudo xcodebuild -license accept
   ```

4. **Instalar CocoaPods:**
   ```bash
   sudo gem install cocoapods
   pod --version  # verificar instalação
   ```

### 1.6 JDK (Java Development Kit)

```bash
# macOS
brew install openjdk@11
sudo ln -sfn /usr/local/opt/openjdk@11/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-11.jdk

# Linux
sudo apt install openjdk-11-jdk

# Verificar
java -version
```

---

## 2. Instalação de Ferramentas

### 2.1 Verificar Ambiente

Execute o Flutter Doctor para verificar se tudo está configurado:

```bash
flutter doctor -v
```

Resolva todos os problemas indicados antes de continuar.

### 2.2 Configurar Emuladores/Simuladores

#### Android Emulator
```bash
# Via Android Studio:
# Tools > Device Manager > Create Device
# Escolha um dispositivo (ex: Pixel 5)
# Selecione uma imagem do sistema (ex: API 31)

# Via linha de comando:
avdmanager create avd -n Pixel_5_API_31 -k "system-images;android-31;google_apis;x86_64" -d "pixel_5"
```

#### iOS Simulator (macOS)
```bash
# Listar simuladores disponíveis
xcrun simctl list devices

# Abrir simulador
open -a Simulator
```

---

## 3. Configuração do Projeto

### 3.1 Clonar o Repositório

```bash
git clone https://github.com/KPS250/desenvolvimento-hibrido.git
cd desenvolvimento-hibrido
```

### 3.2 Instalar Dependências

#### Opção 1: Script Automatizado (Recomendado)
```bash
yarn bootstrap
```

Este script irá:
- Instalar dependências do projeto principal
- Instalar dependências do exemplo
- Instalar pods do iOS
- Obter pacotes do Flutter

#### Opção 2: Manual

```bash
# 1. Dependências principais
yarn install

# 2. Dependências do exemplo
cd example
yarn install

# 3. Flutter packages
cd ../rn_flutter_sdk
flutter pub get

# 4. iOS Pods (somente macOS)
cd ../example/ios
pod install

# Voltar à raiz
cd ../..
```

### 3.3 Limpar Cache (se necessário)

```bash
# React Native
cd example
yarn start --reset-cache

# Flutter
cd ../rn_flutter_sdk
flutter clean
flutter pub get

# Android
cd ../example/android
./gradlew clean

# iOS (macOS)
cd ../ios
rm -rf Pods Podfile.lock
pod install
```

### 3.4 Build do Módulo

```bash
# Na raiz do projeto
yarn prepack
```

---

## 4. Problemas Comuns

### 4.1 Erro: "No connected devices"

**Solução:**
```bash
# Android - Verificar dispositivos
adb devices

# Se vazio, inicie um emulador:
emulator -avd Pixel_5_API_31

# iOS - Verificar simuladores
xcrun simctl list devices booted
```

### 4.2 Erro: "licences have not been accepted"

**Solução:**
```bash
flutter doctor --android-licenses
# Aceite todas as licenças
```

### 4.3 Erro: CocoaPods não instalado

**Solução:**
```bash
sudo gem install cocoapods
pod setup
```

### 4.4 Erro: "Command not found: flutter"

**Solução:**
```bash
# Adicione Flutter ao PATH
export PATH="$PATH:$HOME/flutter/bin"

# Torne permanente adicionando ao .zshrc ou .bashrc:
echo 'export PATH="$PATH:$HOME/flutter/bin"' >> ~/.zshrc
source ~/.zshrc
```

### 4.5 Erro: Metro Bundler não inicia

**Solução:**
```bash
# Limpar cache
watchman watch-del-all
rm -rf node_modules
yarn install
yarn start --reset-cache
```

### 4.6 Erro de Build Android

**Solução:**
```bash
cd android
./gradlew clean
cd ..

# Ou use o script:
yarn clean
```

### 4.7 Erro: "Unable to boot device"

**Solução:**
```bash
# Reiniciar CoreSimulatorService (macOS)
sudo killall -9 com.apple.CoreSimulator.CoreSimulatorService

# Ou reinicie o simulador completamente
```

### 4.8 Erro: Versão do Node incorreta

**Solução:**
```bash
# Usar NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 16
nvm use 16
```

---

## 🎉 Pronto para Desenvolver!

Após concluir todas as etapas, você está pronto para executar o projeto:

```bash
# Android
cd example
yarn android

# iOS (macOS)
yarn ios
```

Se encontrar problemas não listados aqui, consulte:
- [React Native Troubleshooting](https://reactnative.dev/docs/troubleshooting)
- [Flutter Common Issues](https://docs.flutter.dev/resources/faq)
- [Issues do Projeto](https://github.com/KPS250/desenvolvimento-hibrido/issues)

---

**Dica:** Execute `flutter doctor` periodicamente para garantir que seu ambiente está atualizado e funcionando corretamente.

