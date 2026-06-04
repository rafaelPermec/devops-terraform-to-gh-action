# Utiliza uma imagem oficial do Nginx baseada em Alpine Linux como base
FROM nginx:alpine

# Copia os arquivos do diretorio local src para o diretorio padrao do servidor Nginx
COPY ./src /usr/share/nginx/html

# Expoe a porta padrao de comunicacao web do container
EXPOSE 8080