#!/bin/sh
tempo=$(date +"%d_%m_%Y-%H:%M:%S")

# Validando se o campo esta vazio
if [ -z $1 ]  || [ -z $2 ]
then
   echo "Favor informar o numero da porta e a lista de IPs!"
   echo "Use ./nmapPorts.sh <PORTA> <ARQUIVO COM OS IPs>"
else

clear

echo "****************************************************"
echo "|             Port Scanner em bash script          |"
echo "|                   Engine: Nmap                   |"
echo "|                                                  |"
echo "|                    Autor                         |"
echo "|           Gerdan Rezende dos Santos              |"
echo "|          E-mail: gerdan@gmail.com                |"
echo "|                                                  |"
echo "****************************************************"
echo ""

Inicio=$(date +%s.%N);

# Leitura cada endereco IP existente no arquivo
cat $2 | while read host; do

# Executa o Nmap em cada IP encontrado no arquivo retornando a situação da porta

     STATUS=$(nmap -P0 -p $1 $host | grep tcp | awk '{print $2}')

     if [ $STATUS = open ]
     then
                echo "Servidor: $host | Porta: $1 | Status: ABERTA"
                echo "Data e hora da varredura: $tempo" >> /opt/scans/status-UP-$tempo.log
                echo "Servidor: $host | Porta: $1 | Status: ABERTA" >> /opt/scans/status-UP-$tempo.log
                echo "**************************************************" >> /opt/scans/status-UP-$tempo.log
     fi

     if [ $STATUS = closed ]
     then
                echo "Servidor: $host | Porta: $1 | Status: FECHADA"
                echo "Data e hora da varredura: $tempo" >> /opt/scans/status-DOWN-$tempo.log
                echo "Servidor: $host | Porta: $1 | Status: FECHADA" >> /opt/scans/status-DOWN-$tempo.log
                echo "**************************************************" >> /opt/scans/status-DOWN-$tempo.log
     fi

     if [ $STATUS = filtered ]
     then
                echo "Servidor: $host | Porta: $1 | Status: FILTRADA"
                echo "Data e hora da varredura: $tempo" >> /opt/scans/status-FILTRADA-$tempo.log
                echo "Servidor: $host | Porta: $1 | Status: FECHADA" >> /opt/scans/status-FILTRADA-$tempo.log
                echo "**************************************************" >> /opt/scans/status-FILTRADA-$tempo.log
     fi

done
dur=$(echo "$(date +%s.%N) - $Inicio" | bc);
echo ""
echo "Arquivo utilizado: $2"
printf "Tempo de execucao do script: %.3f s\n" $dur
fi
