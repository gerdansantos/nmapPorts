# nmapPorts

Desenvolvido para testar portas ao fazer deploy de serviçoes e verificar possíveis firewalls no caminho das máquinas

# Requisitos

 - Aplicar permissão de execução: sudo chmod +x nmapPorts.sh
 - A distribuição Linux utilizada deve possuir a calculadora BC (padrão na maioria das distribuições);
 - De preferência salvar o script em diretório exclusivo;
 - É necessário que a lista de endereços IPs (IpFiles.txt) esteja no mesmo local que o script

IpFiles Exemplo:
1.1.1.1</br>1.1.1.2</br>2.2.2.1</br>2.2.2.2


Sintaxe:

./nmapPorts.sh 999PORTA IpFiles.txt
