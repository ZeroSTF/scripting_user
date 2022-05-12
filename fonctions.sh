#!/bin/bash

ajouteruser()
{
echo "donner le nom de l'utilisateur à ajouter: "
read user
sudo adduser $user >>liste.txt
}

deverouiller(){
echo "Donner le nom d'utilisateur a déverouiller: "
	read user 
	sudo usermod -U $user
	echo "User unlocked"
}

modifierRep(){
echo "Donnez le nom de l'utilisateur dont vous voulez modifier le repertoire: "
read user
echo "Donnez le nom du nouveau repertoire: "
read user1
cd /home
sudo mkdir -p $user1
sudo usermod -d /home/$user1 $user
echo "repertoire modifié"
cd ~/Desktop/manage_user
}

supprimeruser()
{
echo "Donnez le nom de l'utilisateur à supprimer: "
read nom
sudo deluser --remove-home $nom >>liste_user_v.txt
}

verouiller(){
	echo "Donner le nom d'utilisateur a verouiller :"
	read user 
	sudo usermod -L $user
	echo $user>> liste_user_v.txt
	echo "User locked"
}

show_usage(){
  echo "gestion_user.sh: [-h][-g][-v][-m]"
}

help(){
  cat help.txt
}

menu(){

	#clear
	echo "1-	Afficher comment utiliser la fonction gestion d'utilisateur"
	echo "2-	Pour afficher le help détaillé à partir d’un fichier texte"
	echo "3-	Afficher le nom des auteurs et version du code."
	echo "4-	Verouiller un utilisateur"
	echo "5-	Déverouiller un utilisateur"
	echo "6-	Modifier le repertoire personnel."
	echo "7-	Afficher le menu graphique YAD "
	echo "8-	Ajouter"
	echo "9-      Supprimer"
	echo "10-     Quitter"
	while (true)
	do

		echo "Votre choix : "
	read choice
	case $choice in

			1)
			clear
			show_usage
			menu
			;;

			2)
			clear
			help
			menu
			;;

			3)
			clear
			version
			menu
			;;

         		 	 4)
			clear
			verouiller
			menu
			;;

			5)
			clear
			deverouiller $user
			menu
			;;

			6)
			clear
			modifierRep $1 $2		
			menu
			;;
			7)
			clear
			yadd
			menu
			;;

			8)
			clear
			ajouteruser
			menu
			;;
			
			9)
			clear
			supprimeruser
			menu
			;;
			
			10)
			clear
			exit
			;;

	
	esac

	done
		
	
}

version(){
  echo "Projet Shell -  Hedi Kramti - Riadh Chnitir"
  echo "version 1.0"
  echo "https://github.com/ZeroSTF/scripting_user"
}