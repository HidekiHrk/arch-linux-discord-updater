#!/bin/sh

if [ -e ~/Downloads/discord.tar.gz ]; then
    rm ~/Downloads/discord.tar.gz;
fi


if [ -e ~/Downloads/discord ]; then
    rm -r ~/Downloads/discord;
fi

wget -O ~/Downloads/discord.tar.gz "https://discord.com/api/download?platform=linux&format=tar.gz";

cd ~/Downloads/;

tar -xzvf discord.tar.gz;

if [ -e ~/.local/share/discord ]; then
    rm -r ~/.local/share/discord;
fi

mv ./Discord ~/.local/share/discord;

cd ~/.local/share/discord;

chmod +x ./Discord;

if [ -e ~/.local/share/applications/discord.desktop ]; then
    rm ~/.local/share/applications/discord.desktop
fi

echo "
[Desktop Entry]

# The type as listed above
Type=Application

# The version of the desktop entry specification to which this file conforms
Version=1.0

# The name of the application
Name=Discord

# A comment which can/will be used as a tooltip
Comment=Discord

# The path to the folder in which the executable is run
Path=$HOME/.local/share/discord

# The executable of the application, possibly with arguments.
Exec=$HOME/.local/share/discord/Discord

# The name of the icon that will be used to display this entry
#Icon=jmemorize

# Describes whether this application needs to be run in a terminal or not
Terminal=false

Icon=$HOME/.local/share/discord/discord.png

# Describes the categories in which this entry should be shown
#Categories=Education;Languages;Java;
" | cat >> ~/.local/share/applications/discord.desktop;
