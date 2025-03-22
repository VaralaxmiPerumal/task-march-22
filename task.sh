#!/bin/bash

main_dir=0
while [ $main_dir -eq 0 ]
do
        read -p "Enter the main directory name " main
        if [ -z $main ]
        then
                echo "Given directory name is null, Enter valid directory name"
                exit 0
        fi
        if [ -d $main ]
        then
                echo " Directory name alreay exist, Enter different name"
        else
                mkdir $main
                main_dir=1
        fi
done

for i in {1..3}
do
sub_dir=0
while [ $sub_dir -eq 0 ]
do
        read -p "Enter the $i sub directory name" sub
        if [ -z $main/$sub ]
        then
                echo "Given sub directory name is null, Enter the valid name"
                exit 0
        fi
        if [ -d $main/$sub ]
        then
                echo " Directory name already exist, Enter different name "
        else
                mkdir $main/$sub
        j=1
	while [ $j -le $i ]
        do
                filename=0
		while [ $filename -eq 0 ]
                do
                        read -p "Enter the $j filename" file
                        if [ -z $main/$sub/$file ]
                        then
                                echo "Given filename is null, Enter the valid name"
                                exit 0
                        fi
                        if [ -f $main/$sub/$file ]
                        then
                                echo "Entered filename already exist"
                        else
                                touch $main/$sub/$file
                                filename=1
                        fi
                done
		j=$((j+1))
        done
        sub_dir=1
        fi

done
done
