# wikijs para testear junto a los otros service.

Asi como esta lo que hace es levantar un wikijs, generar un cert para el dominio ficticio wiki.local y dejar todo andando.


## Aclaraciones

Para que funcione el dominio modificar el archivo /etc/hosts agregando 127.0.0.1 wiki.local
Hay que modificarlo para que tome de las .env y no del config.yml (o quizas conviene dejarlo asi si el .env lo usan los otros servicios?)
para que tome el https primero hay que entrar a http://127.0.0.1:80 y hacer la instalacion de wikijs (en dominio poner https://kiwi.local
