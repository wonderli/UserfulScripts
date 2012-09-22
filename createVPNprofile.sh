#!/bin/sh
if [ "$1" = "" ]
then
    echo "ERROR No profile name"
    exit 1
fi
NAME=$1
echo $NAME

OPENVPN_PWD=/etc/openvpn/easy-rsa/keys
#echo $OPENVPN_PWD
OPENVPN_EASYRSA=/etc/openvpn/easy-rsa

/bin/sh $OPENVPN_EASYRSA/build-key $NAME
DIR=`pwd`
NEW_DIR=$DIR/$NAME
#echo $NEW_DIR

mkdir $NEW_DIR

cp $OPENVPN_PWD/ca.crt $OPENVPN_PWD/$NAME.crt $OPENVPN_PWD/$NAME.key $NEW_DIR $OPENVPN_PWD/openvpn.conf

cd $NEW_DIR
pwd
tar cvzf $NAME.tar ca.crt $NAME.crt $NAME.key openvpn.conf

