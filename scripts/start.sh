#!/bin/sh

session_openvpn() {
    if [ -z "$OVPN_CONFIG" ]; then
        echo "NO VPN FILE SPECIFIED\nTORRENTING WITHOUT VPN"
        tail -f /dev/null
    elif [ -z "$OVPN_LOGIN" ] || [ -z "$OVPN_PASSWORD" ]; then
        screen -S openvpn -m openvpn --config $OVPN_CONFIG
    else
        screen -S openvpn -m expect /scripts/connect_vpn.sh
    fi
}
