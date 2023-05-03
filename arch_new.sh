#!/usr/bin/env bash
########################################
#  AUTOR: DIOGO ZIMMERMANN GABRIEL
#  diogozgabriel@gmail.com
#  FUNÇÃO: Arch, preparação
########################################

# Verifica se o usuário está executando o script como root
if [[ $(id -u) -ne 0 ]]; then
   echo "Este script deve ser executado como root" 
   exit 1
fi


#colocar o tempo sob controle do ntp
clear 
echo "colocar o tempo sob controle do ntp" 
sleep 5s
timedatectl set-ntp true

#Configurando o edioma
clear
echo "Configurando o edioma" 
sleep 5s
echo "pt_BR.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

#Configurando Linguagem 
clear
echo "Configurando Linguagem" 
sleep 5s
echo "LANG=pt_BR.UTF-8" > /etc/locale.conf

#Configurando o horário
clear 
echo "Configurando o horário" 
sleep 5s
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime --force

#Sincronização do Relógio com Bios
clear 
echo "Sincronização do Relógio com Bios"
sleep 5s
hwclock --systohc

#configuração de rede
clear
echo "configuração de rede"
sleep 5s
echo "diogo" > /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.0.1 diogo.localdomain diogo" >> etc/hosts

#criar usuário
clear
echo "criar usuário"
sleep 5s
useradd -m -g users -G wheel -s /bin/fish diogo

#configurando sudoers
clear
echo "sudoers" 
sleep 5s
echo "#%wheel ALL=(ALL) ALL" >> /etc/sudoers

#instalando alguns pacotes
clear
echo "instalando alguns pacotes"
sleep 5s
pacman -S xorg xorg-server xorg-xinit xorg-apps mesa mesa-libgl neofetch xf86-video-intel vlc firefox firefox-i18n-pt-br ffmpeg gst-plugins-ugly gst-plugins-good gst-plugins-base gst-plugins-bad gst-libav gstreamer p7zip unrar unzip tar acpi acpid bluez blueman bluez-utils pavucontrol alsa-utils alsa-lib alsa-firmware alsa-plugins pulseaudio pulseaudio-alsa i3-wm i3-gaps i3status rofi dunst picom alacritty thunar thunar-archive-plugin xarchiver lxappearance lightdm lightdm-gtk-greeter grub efibootmgr clementine xorg-xkb-utils xdg-user-dirs

#teclado
clear
echo "teclado"
sleep 5s
echo "
Section "InputClass"
Identifier "system-keyboard"
MatchIsKeyboard "on"
Option "XkbLayout" "br"
Option "XkbModel" "abnt2"
EndSection" >> /etc/X11/xorg.conf.d/00-keyboard.conf

#modificações em pacman.conf
clear
echo "modificações em pacman.conf" 
sleep 5s
echo "[options]" >> /etc/pacman.conf
echo "ParallelDownloads = 5" >> /etc/pacman.conf
echo "color" >> /etc/pacman.conf


echo "Fim das primeiras configurações"
sleep 5s
clear

echo "Próximos passos:"
sleep 5s
echo "
1) passwd
2) grub-install 
3) reboot
"

