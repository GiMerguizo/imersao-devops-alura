# imagem base do Python com a versão 3.13.4
FROM python:3.13.4-alpine3.22

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia o arquivo de requirements para o diretório de trabalho
COPY requirements.txt .

# Instala as dependências do projeto usando pip
# --no-cache-dir: não armazena o cache das dependências, reduzindo o tamanho da imagem
# -r requirements.txt: instala as dependências listadas no arquivo requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código do projeto para o diretório de trabalho
COPY . .

# Define a porta que a aplicação irá escutar
EXPOSE 8000

# Comando para iniciar a aplicação usando uvicorn
# uvicorn: servidor ASGI para aplicações Python
# app:app: importa o objeto 'app' do arquivo 'app.py' (ou o arquivo principal da sua aplicação)
# --host 0.0.0.0: escuta em todas as interfaces de rede
# --port 8000: executa a aplicação na porta 8000
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
