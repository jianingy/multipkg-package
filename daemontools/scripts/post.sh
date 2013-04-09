if [ -d /etc/init ];then

(
cat <<'EOF'
start on startup
start on runlevel [2345]

respawn
exec /usr/bin/svscanboot

EOF
) > /etc/init/svscanboot.conf

echo waiting /etc/init/svscanboot.conf to settle down ...
sleep 1

initctl start svscanboot

fi

if ! grep svscanboot /etc/inittab 2>&1 > /dev/null ; then
    echo SV1:2345:respawn:/usr/bin/svscanboot >>/etc/inittab
    init q
fi

if [ ! -d /service ]; then 
	mkdir /service
fi
