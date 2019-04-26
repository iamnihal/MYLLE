#!/bin/bash
#This script will make your life 0.000001% easier than what it was before!!
clear
echo  "______________________________"
echo  "|           MENU              |"
echo  "|_____________________________|"  
echo  "| 1) Make Directory           |"
echo  "| 2) Create File              |"
echo  "| 3) Copy                     |"
echo  "| 4) Move/Cut                 |"
echo  "| 5) Delete                   |"
echo  "| 6) Rename                   |"
echo  "| 7) List files/directory     |"
echo  "| 8) Show content of file     |"
echo  "| 9) List information of file |"
echo  "|10) System Information       |"
echo  "|11) List Processes           |"
echo  "|12) Kill Process             |"
echo  "-------------------------------"

make_dir()
{        
	echo -e "\nExample:-"
	echo "---------"
	echo "Location:- /home/nihal/Desktop"
	echo -e "Dir Name:- mydirectory \n"
	read -p "Enter location where you want to make directory:- " dir_location
	read -p "Enter name of your directory:- " dir_name
	sudo mkdir -p $dir_location/$dir_name
	if [ "$?" -eq "0" ]
	then
		echo "Directory Created Successfully"
	else
		echo "Error while creating directory"
	fi
}
make_file()
{
	echo -e "\nExample:-"
	echo "---------"
	echo "Location:- /home/nihal/Documents"
	echo -e "File name:- myfile.txt \n"
	read -p "Enter location where you want to make file:- " file_location
	read -p "Enter name of your file:- " file_name
	sudo touch $file_location/$file_name
	if [ "$?" -eq "0" ]
	then 
		echo "File created Successfully"
	else
		echo "Error while creating file"
	fi	
}

copy_task()
{
	echo -e "\nExample:-"
	echo "---------"
	echo "Source:- /home/nihal/Pictures/image.jpeg"
	echo -e "Destination:- /home/nihal/Desktop \n"
	read -p "Enter source location:- " copy_source
	read -p "Enter destination location:- " copy_destination
	sudo cp $copy_source $copy_destination
	if [ "$?" -eq "0" ]
	then
		echo "Copied Successfully"
	else
		echo "I have faced an error While Copying files"
	fi	
	
}

move()
{
	echo -e "\nExample:-"
	echo "---------"
	echo "Source:- /home/nihal/Documents/file.txt"
	echo -e "Destination:- /home/nihal/Desktop \n"
	read -p "Enter source location:- " move_source
	read -p "Enter destination location:- " move_destination
	sudo mv $move_source $move_destination
	if [ "$?" -eq "0" ]
	then
		echo "Moved Successfully"
	else
		echo "There's an error while moving"
	fi
}

delete()
{
	read -p "What you want to delete? (Directory/File) " choice
	if [ "$choice" == "Directory" ]
	then
		echo -e "\nExample:-"
		echo "---------"
		echo -e "Location of Directory:- /home/nihal/mydir \n"
		read -p "Enter the location of directory that you want to delete:- " delete_directory 
		sudo rmdir $delete_directory
		if [ "$?" -eq "0" ]
		then
			echo "Directory Successfully Deleted"
		else
			echo "Error while deleting directory"
		fi
	else
		echo "Example:-"
		echo "---------"
		echo -e "Location of File:- /home/nihal/Desktop/myfile.txt \n"
		read -p "Enter the location of file that you want to delete:- " delete_file
		sudo rm $delete_file
		if [ "$?" -eq "0" ]
		then
			echo "File Successfully Deleted"
		else
			echo "Error faced while deleting file"
		fi
	fi
	}
rename()
{
	echo -e "\nExample:-"
	echo "---------"
	echo -e "Location:- /home/nihal/Documents \n"
	read -p "Enter the location of file/directory that you want to rename:- " rename_location
	read -p "Enter file name:- " old_name
	read -p "Enter the new name:- " new_name
	sudo mv $rename_location/$old_name $rename_location/$new_name
	if [ "$?" -eq "0" ]
	then
		echo "File/Directory Successfully renamed"
	else
		echo "Error while renaming file/directory"
	fi
	
}

list()
{
	read -p "Enter location:- " var_list
	sudo ls -l $var_list

}

content()
{
	echo
	read -p "Enter the location of file:- " var_content
	sudo cat $var_content
}

file_information()
{
	read -p "Enter the location of file:- " var_information
	sudo ls -l $var_information
}

system_information()
{
	echo "Your system information is:-"
	sudo uname -a
}

list_process()
{
	sudo ps -A
}

kill_process()
{
	ps -A
	echo
	read -p "Write the PID value of process that you want to kill:- " var_process
	sudo kill $var_process
	if [ "$?" -eq "0" ]
	then
		echo "Process has been successfully taken down"
	else
		echo "Error while killing process"
	fi
}

read -p "Hey there!! Tell me what to do?? " option
case "$option" in
	"1") make_dir
		;;
	"2") make_file
		;;
	"3") copy_task
		;;
	"4") move
		;;
	"5") delete
		;;
	"6") rename
		;;
	"7") list
		;;
	"8") content
		;;
	"9") file_information
		;;
       "10") system_information	
	       ;;
       "11") list_process
	       ;;
       "12") kill_process
	       ;;
*)
	echo "Don't choose option which doesn't exist in this program!!"
	exit
	;;
esac
