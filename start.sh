#!/bin/sh

RCLONE_CONF=/root/.config/rclone/rclone.conf

if [ ! -f "$RCLONE_CONF" ] ; then
	cp $RCLONE_CONF.template $RCLONE_CONF
	sed -i 's/###TYPE###/'$TYPE'/' $RCLONE_CONF
	sed -i 's/###PROVIDER###/'$PROVIDER'/' $RCLONE_CONF
	sed -i 's/###AUTH###/'$AUTH'/' $RCLONE_CONF
	sed -i 's/###ENDPOINT###/'$ENDPOINT'/' $RCLONE_CONF
	sed -i 's/###REGION###/'$REGION'/' $RCLONE_CONF
	sed -i 's/###ACL###/'$ACL'/' $RCLONE_CONF
	sed -i 's/###ACCESS_KEY###/'$ACCESS_KEY'/' $RCLONE_CONF
	sed -i 's/###SECRET_KEY###/'$SECRET_KEY'/' $RCLONE_CONF
fi

rclone sync $SOURCE $TARGET
