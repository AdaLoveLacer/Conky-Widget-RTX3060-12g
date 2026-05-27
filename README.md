# Conky-Widget-RTX3060-12g
Esse é um Widget do conky motificado para mostrar informações úteis da sua RTX 3060 12G (e provavelmente outras placas Nvidia)

Acredito que funcione com outras placas Nvidia, só não posso afirmar pois não testei em outras, porém se as informações reportadas pelo driver nvidia-smi forem no mesmo formato, acredito que funcionaria.

<img width="218" height="683" alt="image" src="https://github.com/user-attachments/assets/dbdb87d5-f636-444d-8d04-e59c81ccb953" />

Você vai precisar deixar os scripts clock-normalize.sh, Vram-clock-normalize.sh e power-normalize.sh caso queira que o gráfico de VRAM, CLOCK, e POWER-DRAW funcionem corretamente. O Driver da nvidia reporta esses valores que eu acredito que o conky não suporta, como o valor de Power Draw que é reportado como Float, e acredito que o conky espera apenas int.

De qualquer forma, essa foi a solução gambiarra que fiz, esses scripts devem ficar rodando em segundo plano e convertendo os valores informados pelo nvidia-smi em valores que o conky aceita.


Caso você queria rodar esse Widget em outra placa Nvidia, provavelmente você vai precisar ajustar alguns parametros no Widget e nos scripts para se adequarem com sua placa.
