#!/bin/bash
# VRAM Clock Normalizer para Conky
# Converte MHz brutos (0-8000MHz) para porcentagem (0-100%)
# O execigraph do conky espera valores entre 0-100

MAX_VRAM_CLOCK_MHZ=8000  # Valor máximo de clock da VRAM em MHz (ajuste conforme sua placa)

# Lê o VRAM Clock bruto e converte para porcentagem
VRAM_CLOCK=$(nvidia-smi --query-gpu=clocks.current.memory --format=csv,noheader,nounits 2>/dev/null)

if [ -z "$VRAM_CLOCK" ] || [ "$VRAM_CLOCK" = "0" ]; then
    echo "0"
else
    # Remove casas decimais temporariamente para cálculo
    CLOCK_INT=$(echo "$VRAM_CLOCK" | cut -d. -f1)
    
    # Usa bc para divisão com decimais, depois trunca para inteiro
    NORMALIZED=$(echo "scale=0; ($CLOCK_INT * 100) / $MAX_VRAM_CLOCK_MHZ" | bc 2>/dev/null || echo "0")
    echo "$NORMALIZED"
fi
