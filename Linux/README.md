# Linux Version
Essa versão é mais elaborada, pois apresenta já uma interface (simples) responsiva no terminal.
<img src="https://i.imgur.com/X0UYzyK.png">

## Dependências
A ideia foi utilizar o mínimo de depêndencias (que eu conseguir). Dessa forma, estas são:
- tput
- mpg123

O `tput` serve para organizar a interface, enquanto o `mpg123` serve para tocar as rádios propriamente.

## Instalação
- Baixar os arquivos presentes neste diretório;
- Fornecer permissão de execução para o arquivo `main.sh`;
  ```
  chmod +x main.sh`
  ```
- Rodar o programa no diretório junto com o arquivo `radios.txt`.
  ```
  ./main.sh
  ```

## Adicionar Radio
Para adicionar mais rádios é necessário editar o arquivo radios.txt, adicionando uma nova linha do qual é necessário inserir o nome que vai aparecer na hora da escolha e seu endereço para ser ouvida.
  
Exemplo editando o arquivo atual `radios.txt`:
```
STREAM=(
  ["Chillsky - LoFi"]="http://hyades.shoutca.st:8043/autodj"
  ["Chill - Indie"]="http://192.227.85.169:4303/stream"
  ["Trap Eletronic"]="http://149.56.151.181:9992/stream"
  ["Synthwave Retrowave"]="http://139.162.14.151:9090/160mp3"
  ["Nome da Rádio"]="Endereço da Rádio"
)

```

## Selecionar Radio
No menu inicial, basta inserir o número referente a rádio que você quer ouvir.

## Responsividade
O programa identifica quando a resolução do terminal muda e redimensiona a interface para ficar correto.

Caso o terminal não tenha o tamanho mínimo, será apresentado qual o tamanho necessário para rodar o programa. Esse tamanho varia dependendo da quantidade de rádios existentes no arquivo `radios.txt`
<img src="https://i.imgur.com/8p9Nhu1.png">

Não abuse ficar redimensionando muitas vezes e rapidamente, o programa pode quebrar assim.

## Listagem das músicas
Dependendo do tamanho do terminal é apresentado uma quantidade X das últimas músicas que tocaram. Para caso você queira procurar depois e salvar.

Essa listagem é feita utilizando um arquivo temporário `tmp.txt` que é deletado quando é pressionado para sair do programa.
