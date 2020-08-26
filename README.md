# idhash-shell
O IDHash tem por objetivo criar uma hash que possa ser usado para se identificar usando handshake em shell.

Para executar o programa é necessário o seguinte pacote:

*apt install gpg*

*apt install netcat*

*apt install git*

Para baixar o repositório:

*git clone https://github.com/StuartLitt/idhash-shell*

Digite o seguinte para executar:

*cd idhash-shell ; sh idhash.sh*

# Manual e Funcionalidades
**Comandos:**

*ssend - para se identificar*

*sreceived - para checar a identificação*

**ssend:**

*-digite o host do identificador*

*-adicione seu usuario gpg*

*-compartilhe o id de usuario com o identificador*

*-compartilhe a seed numérica com o identificador*

*-envie seu endereço ip(yggdrasil) para o identificador*

*-aguarde o identificador preencher os dados para apertar enter*

*-"///Handshake confirmado///"*

**sreceived:**

*-digite o host do identificador*

*-digite o id do identificado*

*-digite a seed numérica*

-envie seu endereço ip(yggdrasil) para o identificado*

*-aguarde o identificado*

*-"[handshake finalizado]"*
