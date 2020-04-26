# Windows Version <img src="https://i.imgur.com/vP8OTUc.png" align="right">
  Versão para tocar rádio pelo cmd do Windows. </br>
  O script batch utilizado é um improviso, dessa forma ele não é o mais optimizado possível.

## Dependência
- mpg123

## Instalação
- Baixe mpg123:
  - <a target="_blank" href="https://www.mpg123.de/download/win32/1.25.13/">Versão 32 bits</a>.
  - <a target="_blank" href="https://www.mpg123.de/download/win64/1.25.13/">Versão 64 bits</a>.
- Extraia mpg123 e copie o caminho completo do diretório que foi extraido, no meu caso `C:\Users\T-GAMER\Documents\mpg123-1.25.13-x86-64`.
- Baixe o script `radio.bat`.
- Dentro dele edite a variável `PATH` da seguinte forma: `set PATH=%PATH%;<caminho-mpg123>` </br>
  No meu caso ficou da seguinte forma: `set PATH=%PATH%;C:\Users\T-GAMER\Documents\mpg123-1.25.13-x86-64`
- Instalação Feita, agora basta executar o script cliques e escolher a sua rádio :) </br>
<img src="https://i.imgur.com/EdJUJ3R.png">

## Adicionar Rádios
- Por padrão o script vêm com 4 links de rádios, caso queire editar basta:
  - Adicionar uma linha da seguinte forma na seção "Adicione Títulos da rádio": </br>
  `echo <número-de-chamada> - <título-da-rádio>`</br>
  Por exemplo: `echo 5 - Classic` </br>
  - Adicionar uma linha da seguinte forma na seção "Adicione o link da rádio": </br>
  `if %radio% == <número-de-chamada> set play=<endereço-da-rádio>` </br>
  Por exemplo: `if %radio% == 5 set play=http://123.123.123.123:1234/stream`
  
## Dica
Crie um atalho para seu script e deixe onde você achar mais prático, por exemplo na área de trabalho, dessa forma é possível trocar o icone
do arquivo `.bat` para ficar mais agradável. </br>
<img src="https://i.imgur.com/lPsKM29.png">
