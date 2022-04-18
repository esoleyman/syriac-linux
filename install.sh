#! /bin/sh

###############
# Configuration
###############

basedir="${PWD}"                                # Working directory that this script resides in
fonts_dir="$basedir/meltho-fonts"               # Meltho fonts reside here

user_fonts_dir="$HOME/.local/share/fonts"       # User installed fonts directory
user_fc_dir="$HOME/.config/fontconfig/conf.d"   # User installed fontconfig directory
user_fc_file="65-fonts-syriac.conf"             # Keep the fontconfig convention

estrangelo_font="Estrangelo Quenneshrin"
serto_font="Serto Jerusalem"
east_syriac_font="East Syriac Adiabene"


###############
# Main
###############


## FONT INSTALLATION

printf "1. Install Meltho fonts\n"
printf "\n   Font directory: %s\n" "$user_fonts_dir"

if mkdir -p "$user_fonts_dir/meltho-fonts"; then
    printf "   [+] %s\n" "Created directory"
else
    printf "   [-] %s\n" "Failed to create directory"
fi

cp -r "$fonts_dir/" "$user_fonts_dir"
if [ $? -eq 0 ]; then
    printf "   [+] %s\n" "Copied fonts"
else
    printf "   [-] %s\n" "Failed to copy fonts"
fi

printf "\n"

## FONTCONFIG INSTALLATION

printf "2. Configure fontconfig file\n\n"

printf "   Please select your preferred Syriac style script:\n"
printf "       1) Estrangelo\n"
printf "       2) Serto\n"
printf "       3) East Syriac\n\n"

printf "   Choice: "

read -r style_script

case $style_script in
    1) preferred_style=$estrangelo_font ;;
    2) preferred_style=$serto_font ;;
    3) preferred_style=$east_syriac_font ;;
    *) exit;;
esac

printf "\n   Fontconfig file: %s\n" "$user_fc_dir/$user_fc_file"
if mkdir -p "$user_fc_dir/"; then
    printf "   [+] %s\n" "Created directory: $user_fc_dir"
else
    printf "   [-] %s\n" "Failed to create directory: $user_fc_dir"
fi

fc_file=$(cat "$basedir/$user_fc_file")
printf '%s' "$fc_file" | sed -e "s/preferred_syriac_font/${preferred_style}/g" > "$user_fc_dir/$user_fc_file"
printf "   [+] Wrote fontconfig file\n\n"


## FONTCONFIG CACHE UPDATE
printf "3. Updating fontconfig cache\n"

# Force fontconfig to update it's cache
fc-cache -f

printf "\n4. Installation Complete"

exit
