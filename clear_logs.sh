#!/bin/bash

# Caminho para os arquivos de log específicos
LOG_FILE_1="/caminho/para/o/arquivo1.log"
LOG_FILE_2="/caminho/para/o/arquivo2.log"

# Tamanho limite para os arquivos de log (em bytes)
SIZE_LIMIT=$((2*1024*1024*1024)) # 2GB

# Verificar e limpar o arquivo 1 se exceder o tamanho limite
if [ $(stat -c %s "$LOG_FILE_1") -gt $SIZE_LIMIT ]; then
    > "$LOG_FILE_1"
    echo "Conteúdo do arquivo $LOG_FILE_1 foi limpo pois excedeu o limite de tamanho."
fi

# Verificar e limpar o arquivo 2 se exceder o tamanho limite
if [ $(stat -c %s "$LOG_FILE_2") -gt $SIZE_LIMIT ]; then
    > "$LOG_FILE_2"
    echo "Conteúdo do arquivo $LOG_FILE_2 foi limpo pois excedeu o limite de tamanho."
fi
