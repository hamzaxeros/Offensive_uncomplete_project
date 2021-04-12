#!/bin/bash

if [[ $1 == true ]]
then
echo -en "\033[1;32m[\033[0;32m ✔ \033[1;32m]    \033[1;33m\tPlease choose your environment theme : \033[1;32m"
read chosed_theme
else
echo -en "\033[1;31mStarting"
sleep 0.7
echo -n "."
sleep 0.7
echo -n "."
sleep 0.7
echo -n "."
sleep 0.7
echo -n "."
sleep 0.7
echo -n "."
sleep 0.7
echo -n "."
echo -e "\033[1J"
./design.sh
echo -e "\n\033[1;32m[\033[1;31m * \033[1;32m] \033[1;33m1:\t\033[1;32mOffensive Hacker type."
echo -e "\033[1;32m[\033[1;31m * \033[1;32m] \033[1;33m2:\t\033[1;32mOffensive Normal awesome type."
echo -e "\033[1;32m[\033[1;31m * \033[1;32m] \033[1;33m99:\t\033[1;32mExit.\n"

echo -en "\033[1;32m[\033[0;32m ✔ \033[1;32m]    \033[1;33m\tPlease choose your environment theme : "
read chosed_theme
echo -e "\033[0m"
fi




function hackerTypeTheme(){

      # Moving all important files
      sudo mkdir /usr/share/themes
      sudo mkdir /usr/share/icons
      sudo cp -r ./penetration/themes/* /usr/share/themes
      sudo cp -r ./penetration/icons/* /usr/share/icons
      mkdir ~/.themes
      mkdir ~/.icons
      cp -r ./penetration/themes/* ~/.themes
      cp -r ./penetration/icons/* ~/.icons

      # Setting application theme
      gsettings set org.gnome.desktop.interface gtk-theme penetration_application
      gsettings set org.gnome.desktop.wm.preferences theme penetration_application

      # Setting icons
      gsettings set org.gnome.desktop.interface icon-theme penetration_icon

      # Setting cursor
      gsettings set org.gnome.desktop.interface cursor-theme penetration_cursor

      # Setting shell
      gsettings set org.gnome.shell.extensions.user-theme name penetration_shell

      #grub installation
      cd penetration/penetration_grub && chmod +x install.sh && ./install.sh && cd ../../

      # setting background
      gsettings set org.gnome.desktop.background picture-uri "file://$PWD/penetration/wallpaper.png"

      echo "\n\033[1;32m[\033[0;32m ✔ \033[1;32m]    \033[1;33mCongrate your UNIX / Linux is setup successfull!\n\033[0m"


}
function normalAwesomeTypeTheme(){

      # Moving all important files
      sudo mkdir /usr/share/themes
      sudo mkdir /usr/share/icons
      sudo cp -r ./personal/themes/* /usr/share/themes
      sudo cp -r ./personal/icons/* /usr/share/icons
      mkdir ~/.themes
      mkdir ~/.icons
      cp -r ./personal/themes/* ~/.themes
      cp -r ./personal/icons/* ~/.icons
      # Setting application theme
      gsettings set org.gnome.desktop.interface gtk-theme personal_application
      gsettings set org.gnome.desktop.wm.preferences theme personal_application

      # Setting icons
      gsettings set org.gnome.desktop.interface icon-theme personal_icon

      # Setting cursor
      gsettings set org.gnome.desktop.interface cursor-theme personal_cursor

      # Setting shell
      gsettings set org.gnome.shell.extensions.user-theme name personal_shell

      #grub installation
      cd personal/personal_grub && chmod +x install.sh && ./install.sh && cd ../../

      # setting background
      gsettings set org.gnome.desktop.background picture-uri "file://$PWD/personal/wallpaper.jpg"

      echo "\n\033[1;32m[\033[0;32m ✔ \033[1;32m]    \033[1;33mCongrate your UNIX / Linux is setup successfull!\n\033[0m"

}


function installationFunction(){
  if [[ $chosed_theme = 1 ]]
  then
    sudo apt-get update && sudo apt --fix-broken install && sudo apt install gnome-tweak-tool -y && sudo apt install gnome-shell-extensions -y
    hackerTypeTheme
  elif [[ $chosed_theme = 2 ]]
  then
    sudo apt-get update && sudo apt --fix-broken install && sudo apt install gnome-tweak-tool -y && sudo apt install gnome-shell-extensions -y
    normalAwesomeTypeTheme
  elif [[ $chosed_theme = 99 ]]
  then
    echo -n ""
  else
    ./install.sh true
  fi
}


# Run the whole script from here .............................
installationFunction
