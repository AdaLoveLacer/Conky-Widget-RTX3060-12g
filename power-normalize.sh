#!/bin/bash
# Power Draw Normalizer para Conky
# Converte watts brutos (0-187W) para porcentagem (0-100%)
# O execigraph do conky espera valores entre 0-100

MAX_WATTAGE=187  # Valor máximo da GPU em watts (ajuste conforme sua placa)

# Lê o power draw bruto e converte para porcentagem
POWER_DRAW=$(nvidia-smi --query-gpu=power.draw --format=csv,noheader,nounits 2>/dev/null)

if [ -z "$POWER_DRAW" ] || [ "$POWER_DRAW" = "0" ]; then
    echo "0"
else
    # Remove casas decimais temporariamente para cálculo
    POWER_INT=$(echo "$POWER_DRAW" | cut -d. -f1)
    
    # Usa bc para divisão com decimais, depois trunca para inteiro
    NORMALIZED=$(echo "scale=0; ($POWER_INT * 100) / $MAX_WATTAGE" | bc)
    echo "$NORMALIZED"
fi
