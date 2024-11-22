#!/bin/sh

echo "> downloading & installing portals files  Please Wait ..."
sleep 3

wget --show-progress -qO /etc/enigma2/MultiStalkerPro.json "https://raw.githubusercontent.com/Ham-ahmed/portals/refs/heads/main/MultiStalkerPro.json"
download=$?
echo ''
if [ $download -eq 0 ]; then
echo "> installation of portals files  finished"
sleep 3

echo "> Setup the plugin..."
# Configure ajpanel_settings
touch "$temp_dir/temp_file"
cat <<EOF > "$temp_dir/temp_file"
config.plugins.MultiStalkerPro.adult=True
config.plugins.MultiStalkerPro.color=mspro gradient 2
config.plugins.MultiStalkerPro.extplayer_subtitle_font_color=#00ffff00
config.plugins.MultiStalkerPro.extplayer_subtitle_pos=86
config.plugins.MultiStalkerPro.host=http://pro.netmos.ovh:7355/c/
config.plugins.MultiStalkerPro.username=216670135892029
config.plugins.MultiStalkerPro.password=OuyRN2Ph@W
config.plugins.MultiStalkerPro.mainmenu=True
config.plugins.MultiStalkerPro.portalNB=43
config.plugins.MultiStalkerPro.PvrServiceType=5002
config.plugins.MultiStalkerPro.subDL=AR
config.plugins.MultiStalkerPro.tmdb_key=462c2e610e5c68bcb98b51fd5c5b09c6
config.plugins.MultiStalkerPro.tmdbL=ar-AR
EOF

# Update Enigma2 settings
sed -i "/MultiStalkerPro/d" /etc/enigma2/settings
grep "config.plugins.MultiStalkerPro.*" "$temp_dir/temp_file" >> /etc/enigma2/settings
rm -rf "$temp_dir/temp_file" >/dev/null 2>&1

sleep 2
echo "> Setup done..., Please wait enigma2 restarting..."
sleep 1
echo "> H-Ahmed"

# Restart Enigma2 service or kill enigma2 based on the system
if [ -f /etc/apt/apt.conf ]; then
    sleep 2
    systemctl restart enigma2
else
   echo "" 
echo "" 
echo "**********************************************************
echo "#                   INSTALLED SUCCESSFULLY              #"
echo "*                       ON - Panel                      *"
echo "*                Enigma2 restart is required            *"
echo "**********************************************************"
echo "               UPLOADED BY  >>>>   HAMDY_AHMED           "
sleep 4;
	echo '======================================================'
############################################                                                                                                                  
echo ". >>>>         RESTARING         <<<<"
echo "**********************************************************"
wait
killall -9 enigma2
fi
else
echo "> $plugin-$version package installation failed"
sleep 3
fi
    
