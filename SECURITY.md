# Política de Segurança

## 🔒 Versões Suportadas

Atualmente estamos fornecendo atualizações de segurança para as seguintes versões:

| Versão | Suportada          |
| ------ | ------------------ |
| 0.1.x  | :white_check_mark: |
| < 0.1  | :x:                |

## 🐛 Reportando uma Vulnerabilidade

A segurança do nosso projeto é levada muito a sério. Se você descobrir uma vulnerabilidade de segurança, agradecemos sua ajuda em divulgá-la de forma responsável.

### Como Reportar

**NÃO** crie uma issue pública para vulnerabilidades de segurança.

Por favor, envie um email para: **kpshinde25@gmail.com** com:

1. **Descrição** da vulnerabilidade
2. **Passos para reproduzir** o problema
3. **Impacto potencial** da vulnerabilidade
4. **Versão(ões)** afetada(s)
5. **Sugestões de correção** (se houver)

### O que Esperar

- **Confirmação:** Confirmaremos o recebimento em até 48 horas
- **Investigação:** Investigaremos e validaremos o problema
- **Correção:** Trabalharemos em uma correção
- **Divulgação:** Coordenaremos a divulgação pública após a correção
- **Crédito:** Você será creditado pela descoberta (se desejar)

## 🛡️ Práticas de Segurança

### Para Desenvolvedores

#### Dependências
```bash
# Verificar vulnerabilidades regularmente
yarn audit

# Corrigir automaticamente quando possível
yarn audit fix
```

#### Secrets e Credenciais
- **NUNCA** commite chaves de API, tokens ou senhas
- Use variáveis de ambiente (`.env`)
- Adicione arquivos sensíveis ao `.gitignore`
- Use serviços de gerenciamento de secrets em produção

#### Validação de Entrada
```typescript
// ❌ Não faça isso
const data = userInput;

// ✅ Faça isso
const data = validateAndSanitize(userInput);
```

#### Comunicação Native-Flutter
- Valide todos os dados recebidos via MethodChannel
- Sanitize inputs antes de processar
- Implemente timeout para operações longas

### Para Usuários

#### Instalação Segura
```bash
# Sempre verifique a integridade do pacote
yarn add desenvolvimento-hibrido --check-files

# Revise dependências instaladas
yarn list --depth=0
```

#### Permissões
- Revise as permissões solicitadas no AndroidManifest.xml
- Revise os capabilities no Info.plist (iOS)
- Questione permissões desnecessárias

#### Atualizações
- Mantenha o SDK sempre atualizado
- Leia as release notes antes de atualizar
- Teste em ambiente de desenvolvimento primeiro

## 🔍 Verificação de Segurança

### Checklist de Segurança

- [ ] Nenhuma credencial no código-fonte
- [ ] Dependências atualizadas
- [ ] Input validation implementada
- [ ] Output encoding quando necessário
- [ ] Permissões mínimas necessárias
- [ ] HTTPS para comunicação de rede
- [ ] Dados sensíveis criptografados
- [ ] Logs não contêm informações sensíveis

### Ferramentas Recomendadas

#### JavaScript/TypeScript
- **ESLint** com regras de segurança
- **npm audit** / **yarn audit**
- **Snyk** para análise de dependências

#### Flutter/Dart
- **dart analyze** com lints de segurança
- **flutter pub outdated** para dependências
- **OWASP Mobile Security Testing Guide**

#### Native
- **Android Lint** para código Android
- **Xcode Static Analyzer** para código iOS
- **MobSF** para análise de APK/IPA

## 📋 Políticas de Dados

### Coleta de Dados
Este SDK **NÃO** coleta:
- Dados pessoais dos usuários
- Informações de localização
- Dados de analytics automaticamente

### Armazenamento Local
- Dados são armazenados localmente via Hive (Flutter)
- Nenhum dado é enviado para servidores externos pelo SDK
- Criptografia é recomendada para dados sensíveis

### Privacidade
Consulte nossa [Política de Privacidade](PRIVACY.md) para mais detalhes.

## 🚨 Vulnerabilidades Conhecidas

Atualmente não há vulnerabilidades conhecidas.

Histórico de vulnerabilidades corrigidas:
- Nenhuma até o momento

## 📞 Contato

Para questões de segurança:
- **Email:** kpshinde25@gmail.com
- **GitHub:** [@KPS250](https://github.com/KPS250)

Para questões gerais:
- [Abra uma issue](https://github.com/KPS250/desenvolvimento-hibrido/issues)
- [Discussões](https://github.com/KPS250/desenvolvimento-hibrido/discussions)

## 🙏 Agradecimentos

Agradecemos a todos que reportam vulnerabilidades de forma responsável e nos ajudam a manter o projeto seguro.

---

**Última atualização:** 23 de Novembro de 2025

