#Autor:Jorge Montero López
#Fecha:29/01/2026

#!/bin/bash

clear

while true; do
   
    echo "MENÚ"
    echo "A) Añadir una entrada"
    echo "B) Buscar por dni"
    echo "C) Ver la agenda completa"
    echo "D) Eliminar todas las entradas de la agenda"
    echo "E) Finalizar"
    read -p "Seleccione una opción: " op

    case $op in
       
 A)
          	 	read -p "Introduce el dni: " dni
           		if grep  ^$dni Agenda.txt; then
               		 echo "La persona ya está dada de alta"
           		 else
               		 read -p "Introduce tu nombre: " nom
               		 read -p "Introduce tus apellidos: " ape
               		 read -p "Introduce tu localidad: " localidad
                		echo "$dni:$nom:$ape:$localidad" >> agenda.txt
           		 fi
            ;;

        B)
            read -p "Introduce un dni: " dni
            linea=$(grep ^$dni Agenda.txt)
            if [ -n $linea ]; then
            	nom=$(echo $linea | cut -f 2 -d ":")
               	 ape=$(echo $linea | cut -f 3 -d ":")
               	localidad=$(echo $linea | cut -f 4 -d ":")
               	 echo "La persona con DNI número $dni es: $nom $ape, y vive en $localidad"
            else
                	echo "Error, el dni introducido no está dado de alta"
            fi
            ;;

        C)
            if [ -s "Agenda.txt" ]; then
                cat Agenda.txt
            else
                echo "Agenda vacía"
            fi
            ;;

        D)
            > Agenda.txt
            echo "Contenido de Agenda.txt borrado"
            ;;

        E)
            echo “Saliendo”
	break;
           ;;

        *)
            echo "Opción incorrecta"
            ;;
    esac
done
