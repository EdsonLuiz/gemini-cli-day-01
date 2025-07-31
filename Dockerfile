FROM alpine:latest

RUN apk add --no-cache nodejs npm

# Instalar a CLI Gemini (substitua pelo comando de instalação real)
RUN npm install -g @google/gemini-cli

COPY hello.sh /app/hello.sh
RUN chmod +x /app/hello.sh

WORKDIR /app

CMD ["./hello.sh"]
