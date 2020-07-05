#!/usr/bin/env bash

#------------------------------------------Header
#	Author
#		Felipe Fernandes
#
#	Program
#		Terminal Radio
#
#	Description
#		Simple way to listen radios in terminal.
#
#------------------------------------------------

#---------------------------------------Functions

help(){
	less << END

	Terminal Radio

	Esse programa consiste em uma maneira simples e minimamente elegante de se ouvir rádios online pelo terminal.


	Adicionar Radio

	Para adicionar mais rádios é necessário editar o arquivo radios.txt, adicionando uma nova linha do qual é necessário inserir o nome que vai aparecer na hora da escolha e seu endereço para ser ouvida.


	Selecionar Radio

	No menu inicial, basta inserir o número referente a rádio que você quer ouvir.


	Responsividade

	O programa identifica quando a resolução do terminal muda e redimensiona a interface para ficar correto.
	Não abuse ficar redimensionando muitas vezes e rapidamente, o programa pode quebrar assim.


	Listagem das músicas

	Dependendo do tamanho do terminal é apresentado uma quantidade X das últimas músicas que tocaram. Para caso você queira procurar depois e salvar.
	Essa listagem é feita utilizando um arquivo temporário que é deletado quando é pressionado para sair do programa.
END
}

border(){
	for (( i = 0; i < ${c}; i++ )); do

		if [ "$i" -eq '0' ] ; then
			echo -n "${sets[$1]}"

		elif [ "$i" -eq "$((c - 1))" ] ; then
			echo -n "${sets[$2]}"

		else
			echo -n "${sets[$3]}"
		fi

	done
}

interface_main(){

	sets=(┃ ━ ┏ ┓ ┗ ┛)
	c=$(tput cols)
	l=$(tput lines)
	n_r="${#STREAM[@]}"
	n_l="$(((n_r * 2) + 9))"

	#Check Resolution
if [ "$c" -le '49' ] || [ "$l" -le "$n_l" ]; then
	reset

	if [ "$c" -le "17" ]; then

		echo -e "Wrong Resolution!\n"
		echo -e "Crash!"
		exit

	else

		tput cup "$(( (l / 2) - 1))" "$(((c / 2) - 9))"
		echo -n "Wrong Resolution!"
		tput cup "$((l / 2))" "$(((c / 2) - 8))"
		echo -n "Min Columns: 50"
		tput cup "$(( (l / 2) + 1))" "$(((c / 2) - 7))"
		echo -n "Min Lines: $n_l"
		sleep 2
	fi

	return 1
else

	reset
		### First Block

	border 2 3 1

	#Sides Borders
	y='1'
	for (( i = 0; i < "$((l - 8))"; i++ )); do

		echo -n "${sets[0]}"		#Left Border
		tput cup $y "$((c - 1))"
		echo -n "${sets[0]}"		#Right Border
		((y++))

	done

	border 4 5 1


		### Second Block

	border 2 3 1

	#Middle Border
	echo -n "${sets[0]}"
	tput cuf "$((c - 1))"
	echo -n "${sets[0]}"

	border 4 5 1


		### Third Block

	border 2 3 1

	echo -n "${sets[0]}"
	tput cuf "$((c - 1))"
	echo -n "${sets[0]}"

	border 4 5 1


		### Texts

	#Header
	pos="$((c / 2))"
	tput cup 0 "$((pos - 4))"
	echo -n " Radio "

	#Footer
	tput cup "$((l - 2))" "$((pos - 13))"
	echo -n " h - Help Menu | q - Quit "

	#List
	lpos='2'
	tput cup $lpos 3
	n='1'

	for radio in "${!STREAM[@]}"; do
		echo -n "${n}) $radio"
		tput cup "$((lpos + 2))" 3
		((lpos+=2)) ; ((n++))
	done


	#Select
	tput cup "$((l - 5))" 2
	echo -n "Select > "

	return 0
fi
}

interface_playing(){
	reset && tput civis
	c=$(tput cols)
	l=$(tput lines)

	# First Block
	border 2 3 1

	y='1'
	for (( i = 0; i < "$((l - 8))"; i++ )); do

		echo -n "${sets[0]}"		#Left Border
		tput cup $y "$((c - 1))"
		echo -n "${sets[0]}"		#Right Border
		((y++))

	done

	border 4 5 1


	# Second Block
	border 2 3 1

	echo -n "${sets[0]}"
	tput cuf "$((c - 1))"
	echo -n "${sets[0]}"

	border 4 5 1

	#Third Block
	border 2 3 1

	echo -n "${sets[0]}"
	tput cuf "$((c - 1))"
	echo -n "${sets[0]}"

	border 4 5 1

	# Header
	pos="$((c / 2))"
	tput cup 0 "$((pos - 7))"
	echo -n " Playing Now "


	# Radio Title
	title_length=${#1}
	tput cup 2 "$((pos - (title_length / 2) - 1))"
	echo -n "$1"


	#Footer Text
	tput cup "$((l - 2))" "$((pos - 11))"
	echo -n " b - Back | q - Quit "

	# Playing
	mpg123 -v $2 2> tmp.txt &
	pid="$!"
	prev_music=''
	m_pos='4'
	music_n="$((l - 8))"
	action='-'

	#Showing titles
	while  : ; do
		
		music="$(tac tmp.txt | egrep "StreamTitle='[^']+" | cut -d\' -f 2 | head -n 1)"

		if [[ "$music" != "$prev_music" ]] && [ "$m_pos" -lt "$music_n" ] ; then	
			tput cup $m_pos 3
			echo -n "> $music"
			((m_pos+=1))
		fi

		if [[ "$music" != "$prev_music" ]]; then
	
			tput cup "$((l - 5))" 2

			#Clear previous name music
			for (( i = 0; i < "$((c - 3))"; i++ )); do
				echo -n " "
			done
			
			# Print actual name music
			tput cup "$((l - 5))" 2
			echo -n "Music: $music"
		fi
		
		prev_music="$music"

		read -t 1 -n 1 -s action

		# Check action while playing
		if [[ "${action,,}" == "q" ]]; then &> /dev/null
			reset
			kill -9 "$pid" > /dev/null
			rm tmp.txt
			exit
		elif [[ "${action,,}" == "b" ]]; then &> /dev/null
			kill -9 "$pid" > /dev/null
			r=''
			break
		fi
	done
}

main(){

	# Kill process if still running3
	kill -9 "$pid" &> /dev/null

	# Start interface
	right_res='1'
	while [ "$right_res" -eq '1' ]; do
		interface_main
		right_res="$?"
	done

	[ -z "$r" ] && read r 		#Select Option
	
	# Check options
	[[ "${r,,}" == 'h' ]] && { help;} 
	[[ "${r,,}" == 'q' ]] && { rm tmp.txt; clear; exit;}

	# Getting IP and Title
	local i='1'
	for radio in "${!STREAM[@]}"; do
		if [ "$r" -eq "$i" ]; then
			title="$radio"
			break
		else
			((i++))
		fi
	done
	ip=${STREAM[$title]}

	[ -n "$ip" ] && interface_playing "$title" "$ip"

	r=''
}
#------------------------------------------------

# Radio List
declare -A STREAM
source radios.txt

# Rezise Terminal
trap "main" SIGWINCH

# Init
while : ; do
	main
done

