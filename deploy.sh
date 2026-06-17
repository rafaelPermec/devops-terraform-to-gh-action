#!/bin/bash

# Define que o script deve parar imediatamente se qualquer comando falhar
set -e

# Variáveis do ambiente de Deploy
CONTAINER_NAME="app_pucrs_prod"
PORTA_HOST=8080
IMAGE_TAG=${1:-"latest"} # Recebe a TAG por parâmetro ou usa 'latest' por padrão

echo "===================================================="
echo "🚀 INICIANDO SCRIPT DE DEPLOY DE CONTAINERS"
echo "===================================================="

# 1. Limpeza preventiva de containers antigos com o mesmo nome
if [ "$(docker ps -a -q -f name=$CONTAINER_NAME)" ]; then
    echo "=> Removendo container antigo em execução..."
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
fi

# 2. Executa o deploy do novo container mapeando as portas lógicas
echo "=> Inicializando o novo container: $CONTAINER_NAME na porta $PORTA_HOST..."
docker run -d -p $PORTA_HOST:80 --name $CONTAINER_NAME minha-app-pucrs:$IMAGE_TAG

# 3. Aguarda o tempo de inicialização do servidor Nginx (Healthcheck Period)
echo "=> Aguardando estabilização do servidor web..."
sleep 5

# 4. Teste de Fumaça (Smoke Test) real para validar se o site está online
echo "=> Executando validação de saúde via requisição HTTP (Smoke Test)..."
if curl --fail http://localhost:$PORTA_HOST > /dev/null 2>&1; then
    echo "[SUCCESS] Deploy realizado com sucesso! O container está saudável."
    echo "===================================================="
else
    echo "[ERROR] Falha crítica: O container subiu mas não está respondendo HTTP."
    echo "===================================================="
    exit 1
fi