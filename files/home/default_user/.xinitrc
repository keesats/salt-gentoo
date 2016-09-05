# <--Managed by Salt-->

{% if grains['desktop_type'] == 'awesome-wm' %}
# Awesome WM .xinitrc
eval $(gnome-keyring-daemon --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
exec awesome

{% elif grains['desktop_type'] == 'mate' %}
# MATE .xinitrc
exec ck-launch-session dbus-launch mate-session

{% elif grains['desktop_type'] == 'xfce' %}
# XFCE .xinitrc
eval $(gnome-keyring-daemon --components=pkcs11,secrets,ssh,gpg)
export GNOME_KEYRING_PID
export GNOME_KEYRING_SOCKET
export SSH_AUTH_SOCK
export GPG_AGENT_INFO
exec startxfce4

{% endif %}
