# Weather Project - React Native + Flutter Integration

## Sumário

- [Resumo do Projeto](#resumo-do-projeto)
- [Arquitetura do Projeto](#arquitetura-do-projeto)
- [Design das Telas](#design-das-telas)
- [Como Usar a API do Clima (OpenWeatherMap via RapidAPI)](#como-usar-a-api-do-clima-openweathermap-via-rapidapi)
    - [Decifrando a resposta da API](#decifrando-a-resposta-da-api)
    - [Exemplo de requisição](#exemplo-de-requisição)
- [Como executar o projeto](#como-executar-o-projeto)
- [Licença](#licença)

***

## Resumo do Projeto

Este projeto é um aplicativo mobile híbrido que utiliza **React Native** e **Flutter** para construir uma experiência de previsão do tempo moderna e prática. A aplicação permite consultar condições climáticas de cidades brasileiras, utilizando a API OpenWeatherMap integrada via RapidAPI. A interface segue padrões modernos e foi prototipada no Figma.

***

## Arquitetura do Projeto

- **Frontend:** React Native integrado com Flutter (utilizando o pacote para integração em RN).
- **API:** OpenWeatherMap (consumida via RapidAPI para facilitar autenticação e quotas).
- **Geolocalização:** Busca de latitude/longitude utilizando Nominatim (OpenStreetMap).
- **Design das Telas:** Disponível no Figma.

***

## Design das Telas

A prototipação pode ser acessada diretamente pelo link do Figma (requer login):  
https://www.figma.com/design/1yTP30oxJVsDBqKA3DhSkn/React---Flutter--Weather-?node-id=0-1

***

## Como Usar a API do Clima (OpenWeatherMap via RapidAPI)

### Passo 1 - Configurar RapidAPI

- Acesse [RapidAPI](https://rapidapi.com/) e busque por "OpenWeatherMap".
- Assine o plano desejado e obtenha sua API Key da plataforma RapidAPI.

### Passo 2 - Consumir a API

Utilize o endpoint de previsão de 5 dias (`/forecast`) passando as coordenadas obtidas com Nominatim (latitude e longitude).

**Exemplo de chamada via fetch:**  
```javascript
const url = 'https://open-weather13.p.rapidapi.com/city/latlon?lat={LAT}&lon={LON}';
fetch(url, {
  headers: {
    'X-RapidAPI-Key': 'YOUR_RAPIDAPI_KEY',
    'X-RapidAPI-Host': 'open-weather13.p.rapidapi.com'
  }
})
.then(r => r.json())
.then(data => {
  // Utilize o método abaixo para decifrar o JSON!
});
```

### Decifrando a resposta da API

A resposta é um JSON extenso, com previsões a cada 3 horas para os próximos 5 dias.

Principais campos:
- `"cod"`: Status da API (200 = sucesso)
- `"cnt"`: Número de previsões retornadas (normalmente 40)
- `"list"`: Array principal de previsões (cada item = 3h)
  - `main.temp`: Temperatura (Kelvin, converter: **°C = K - 273.15**)
  - `main.feels_like`: Sensação térmica (Kelvin)
  - `main.humidity`: Umidade relativa (%)
  - `weather[0].main`: Condição geral (Clouds, Rain etc)
  - `weather[0].description`: Descrição detalhada
  - `rain.3h`: Volume de chuva nas últimas 3h (se presente)
  - `dt_txt`: Data/hora da previsão (legível)
- `"city"`: Informações sobre a cidade (nome, coordenadas, população etc)

Exemplo de como extrair temperatura para exibir:
```javascript
const previsoes = data.list.map(item => ({
  horario: item.dt_txt,
  descricao: item.weather[0].description,
  temperatura: (item.main.temp - 273.15).toFixed(1) + '°C',
  chuva: item.rain?.['3h'] || 0
}));
```

***

## Como executar o projeto

1. Instale dependências com o gerenciador de pacotes do React Native e Flutter.
2. Configure sua chave da RapidAPI em um arquivo de variáveis de ambiente.
3. Execute o app no simulador/emulador desejado.
4. Utilize o campo de busca para selecionar cidade/estado, obtenha as coordenadas e visualize a previsão do tempo nas telas seguindo o Figma.

***

## Licença

MIT - Sinta-se livre para usar e modificar!