#!/bin/bash
# GPU Clock Normalizer para Conky
# Converte MHz brutos (0-2500MHz) para porcentagem (0-100%)
# O execigraph do conky espera valores entre 0-100

MAX_CLOCK_MHZ=2500  # Valor máximo de clock da GPU em MHz (ajuste conforme sua placa)

# Lê o GPU Clock bruto e converte para porcentagem
GPU_CLOCK=$(nvidia-smi --query-gpu=clocks.current.graphics --format=csv,noheader,nounits 2>/dev/null)

if [ -z "$GPU_CLOCK" ] || [ "$GPU_CLOCK" = "0" ]; then
    echo "0"
else
    # Remove casas decimais temporariamente para cálculo
    CLOCK_INT=$(echo "$GPU_CLOCK" | cut -d. -f1)
    
    # Usa bc para divisão com decimais, depois trunca para inteiro
    NORMALIZED=$(echo "scale=0; ($CLOCK_INT * 100) / $MAX_CLOCK_MHZ" | bc 2>/dev/null || echo "0")
    echo "$NORMALIZED"
fi
