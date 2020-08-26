#!/bin/bash
#idhash-shell
#essa versão tem por objetivo executar e fundir os dos clients em um.
#echo "///INSIRA O HOST///"
#host="localhost"


#read host
#echo host > host

#echo -

#echo -
ssend() {
echo "///HOST PARA ESTABELECER CONEXÃO///"
read host
echo "digite o nome de usuario do gpg:"

read user

#echo "|||CRIE UMA SEED NUMERICA PARA O HANDSHAKE|||"

seed=$(date +%s)

user2=$(echo $user $seed | sha256sum)
echo $user2 > sha && gpg -r "$user" -s sha
user2=$(cat sha.gpg | sha256sum)
#seed=$(echo $((RANDOM%10000000+100)))
echo "|||SEED DO HANDSHAKE|||"

echo "SEED:  $seed  "

echo


export seed=$((1+$seed))

frkey=$(echo $user2 | sha256sum)
idhash=$(echo $frkey $seed | sha512sum)
echo $idhash > handshake.txt

gpg -r "$user" -s handshake.txt

echo "///ID DO USUARIO///"
echo
echo $frkey
echo
echo "iniciando handshake..."
echo
echo "digite enter para prosseguir"

read enter

nc $host 7001 -v < handshake.txt.gpg

echo "handshake sendo confirmado..."


export seed=$((1+$seed))

idhash=$(echo $frkey $seed | sha256sum)

echo "aguardando o shake..."

rm -rf shake.gpg

nc -lvp 7002 > shake


shake=$(cat shake)

shake=$(echo $shake*)
idhash=$(echo $idhash*)

if [ "$idhash" = "$shake" ];then
echo
echo "///HANDSHAKE CONFIRMADO///"
fi
}


sreceived() {
echo "///HOST PARA ESTABELECER CONEXÃO///"
read host
echo "Digite o id do usuario: "
read frkey
echo "|||INSIRA A SEED PARA EFETUAR O HANDSHAKE|||"
read seed

export seed=$((1+$seed))

idhash=$(echo $frkey $seed | sha512sum)

echo "aguardando o recebimento do handshake..."

nc -lvp 7001 > shake2.gpg

gpg -d shake2.gpg > shake2

shake=$(cat shake2)

echo "shake inserido..."

idhash=$(echo $idhash*)

shake=$(echo $shake*)

if [ "$idhash" = "$shake" ]; then

export seed=$((1+$seed))

idhash=$(echo $frkey $seed | sha256sum)

echo "finalizando o handshake..."
sleep 5
echo $idhash | nc $host 7002 -v && echo "[Handshake finalizado]"

fi
}
echo "##########COMANDOS###########"
echo "ssend - para enviar o id"
echo "sreceived - para receber o id"
echo "#############################"
echo "digite o comando para executar o cliente: "
read command
command=$(echo $command)
$command

