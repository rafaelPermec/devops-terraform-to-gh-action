# =========================================================================
# Etapa de Execução: Utiliza imagem oficial do Nginx baseada em Alpine Linux
# =========================================================================
FROM nginx:1.25-alpine

# 1. Definição de metadados seguindo as especificações globais da OCI (Open Containers Initiative)
LABEL org.opencontainers.image.title="PUCRS DevOps na Pratica - Fase 1" \
      org.opencontainers.image.description="Container otimizado para o empacotamento do site estatico da PUCRS" \
      org.opencontainers.image.version="1.0.0" \
      org.opencontainers.image.authors="Rafael Permec"

# 2. Configuração do diretório de trabalho padrão do servidor Nginx
WORKDIR /usr/share/nginx/html

# 3. Limpeza preventiva dos arquivos padrões que vêm embutidos na imagem do Nginx
RUN rm -rf ./*

# 4. Cópia limpa dos arquivos locais da aplicação para a raiz do servidor web
COPY ./src/ /usr/share/nginx/html/

# 5. Validação contínua da saúde do container (Healthcheck)
# O Alpine não possui o comando 'curl' por padrão, por isso utilizamos o 'wget' nativo do sistema
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost/ || exit 1

# 6. Exposição explícita da porta de comunicação HTTP
EXPOSE 80

# 7. Inicialização do servidor Nginx garantindo a execução em primeiro plano (foreground)
CMD ["nginx", "-g", "daemon off;"]
