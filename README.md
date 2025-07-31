# Gemini CLI com Docker e GitHub Actions

Este repositório demonstra uma configuração simples de CI/CD utilizando Docker e GitHub Actions. O objetivo é construir uma imagem Docker que contém um script shell e executá-lo automaticamente sempre que uma alteração for enviada para o branch `main`.

## Tecnologias Utilizadas

*   **Docker:** Para criar um ambiente containerizado e garantir que o nosso script execute de forma consistente.
*   **Alpine Linux:** Imagem base do Docker, escolhida por ser extremamente leve.
*   **Node.js:** Instalado na imagem Docker.
*   **Gemini CLI:** Ferramenta de linha de comando (simulada a instalação) dentro da imagem.
*   **GitHub Actions:** Para automação do processo de build e execução (CI/CD).
*   **Shell Script:** O script `hello.sh` que é o nosso "aplicativo".

## Estrutura do Projeto

```
.
├── .github/workflows/main.yml  # Define o workflow do GitHub Actions
├── Dockerfile                  # Instruções para construir a imagem Docker
├── hello.sh                    # Script a ser executado
└── README.md                   # Este arquivo
```

## Como Executar Localmente

Para testar o projeto em sua máquina local, você precisará ter o Docker instalado.

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/EdsonLuiz/gemini-cli-day-01.git
    cd gemini-cli-day-01
    ```

2.  **Construa a imagem Docker:**
    O comando a seguir lê o `Dockerfile` e cria uma imagem chamada `gemini-cli-app`.
    ```bash
    docker build -t gemini-cli-app .
    ```

3.  **Execute o contêiner:**
    Este comando irá criar e iniciar um contêiner a partir da imagem `gemini-cli-app`. O script `hello.sh` será executado, e você verá a saída no seu terminal.
    ```bash
    docker run gemini-cli-app
    ```
    **Saída esperada:**
    ```
    Hello from Gemini CLI!
    ```

## Automação com GitHub Actions

O arquivo `.github/workflows/main.yml` configura um workflow que é acionado a cada `push` no branch `main`.

O workflow executa os seguintes passos:
1.  **Checkout:** Baixa o código do repositório para o ambiente de execução da Action.
2.  **Build Docker image:** Constrói a imagem Docker, exatamente como faríamos localmente.
3.  **Run script in Docker container:** Executa o contêiner, o que por sua vez executa o nosso script `hello.sh`.

Você pode visualizar os logs de execução na aba "Actions" do seu repositório no GitHub.

## Detalhes Técnicos

### Dockerfile
O `Dockerfile` é configurado para:
- Iniciar a partir da imagem `alpine:latest`.
- Instalar `nodejs` e `npm`.
- Instalar a CLI do Gemini (atualmente um placeholder `npm install -g @google/gemini-cli`).
- Copiar o script `hello.sh` para dentro da imagem no diretório `/app`.
- Conceder permissão de execução ao script.
- Definir o diretório de trabalho como `/app`.
- Especificar `CMD ["./hello.sh"]` como o comando padrão a ser executado quando o contêiner iniciar.

### GitHub Actions (`main.yml`)
O workflow utiliza `ubuntu-latest` como o sistema operacional do runner. Ele depende de `actions/checkout@v2` para obter o código e depois executa comandos `docker` padrão para construir e rodar a imagem.
