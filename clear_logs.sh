#!/bin/bash

# Caminho para os arquivos de log específicos
LOG_FILE_1="/opt/wildfly/standalone/log/server.log"
LOG_FILE_2="/var/log/wildfly/console.log"

# Verificar se os arquivos de log existem e têm permissão de leitura
if [ -f "$LOG_FILE_1" ] && [ -f "$LOG_FILE_2" ]; then
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
else
    echo "Um ou ambos os arquivos de log especificados não existem ou não têm permissão de leitura."
fi
