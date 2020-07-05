# Radio Terminal
Ouvir músicas de rádios online com interface feita em puro bash.

## Linux Version
A versão Linux é feita em bash e a ideia é apresentar uma interface que seja minimamente agradável ao usuário, feita diretamente no terminal, que seja responsiva, e, que apresente também as últimas músicas que foram tocadas.

### Dependências
A ideia foi utilizar o mínimo de depêndencias (que eu conseguir). Dessa forma, estas são:
- tput
- mpg123

O `tput` serve para organizar a interface, enquanto o `mpg123` serve para tocar as rádios propriamente.

### Instalação
- Basta baixar os arquivos localizados dentro do diretório `Linux`;
- Fornecer permissão de execução para o arquivo `main.sh`;
  ```
  chmod +x main.sh`
  ```
- Rodar o programa na pasta junto com o arquivo `radios.txt`.
  ```
  ./main.sh
  ```
  
## Windows Version
A versão Windows é feita em batch, e é uma versão totalmente básica, apenas consegue tocar as rádios, mas não tem nenhuma interface customizada.

### Dependências
Por ser uma versão mais simples, existe uma única dependência:
- mpg123
Você pode fazer o download em: 

### Instalação
Após baixar o mpg123 e extraí-lo numa pasta. Siga:
- Coloque o script .bat na mesma pasta do mpg123;
- Crie um atalho do script e fácil acesso (por exemplo na área de trabalho).
Agora quando quiser ouvir basta dar dois cliques no script e funcionará.
Dica: É possível editar a "Imagem" do atalho do script.

## Contato
Caso queira entrar em contato seja qual for o motivo.

Email: felipefernandesgsc@gmail.com

Discord: Mewbi#5028
