# ProxyToggle

Aplicativo macOS simples para ligar e desligar o proxy do sistema com um clique.

![macOS](https://img.shields.io/badge/macOS-10.13%2B-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## O que faz?

ProxyToggle detecta automaticamente sua interface de rede ativa (Wi-Fi ou Ethernet) e permite alternar o proxy HTTP/HTTPS (`127.0.0.1:8080`) através de uma interface gráfica nativa do macOS.

- **Proxy LIGADO** - Configura o proxy web e seguro para `127.0.0.1:8080`
- **Proxy DESLIGADO** - Remove a configuração de proxy
- Notificações nativas ao alternar o estado
- Detecção automática da interface de rede

## Instalação

### Opção 1: Build a partir do código-fonte

```bash
git clone https://github.com/Arthur-Diesel/ProxyToggleMacOS.git
cd ProxyToggleMacOS
./build.sh
```

O app será gerado em `build/ProxyToggle.app`. Arraste para a pasta Aplicativos.

### Opção 2: Download direto

Baixe a última release na aba [Releases](../../releases).

## Uso

1. Abra o **ProxyToggle.app**
2. Uma janela mostrará o status atual do proxy
3. Clique em **Ligar Proxy** ou **Desligar Proxy**
4. Uma notificação confirmará a alteração

## Configuração

Por padrão, o proxy aponta para `127.0.0.1:8080`. Para alterar, edite o arquivo `src/ProxyToggle.sh` e modifique o endereço e porta nas chamadas `networksetup`.

## Estrutura do Projeto

```
ProxyToggle/
├── src/
│   └── ProxyToggle.sh     # Script principal
├── resources/
│   ├── Info.plist          # Configuração do app bundle
│   └── AppIcon.icns        # Ícone do aplicativo
├── build.sh                # Script de build
├── .gitignore
└── README.md
```

## Requisitos

- macOS 10.13 (High Sierra) ou superior
- Permissão para alterar configurações de rede

## Licença

MIT
