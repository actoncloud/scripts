#set -x

if [ "$#" -lt 2 ]; then
	echo "Usage: sh acsdump.sh sql_username sql_user_password [sql_server_ip] "
	exit 1
fi

PORT="3306"
IP_ADDRESS="$3"
USERNAME="$1"
PASSWORD="$2"
LOCATION="./"

if [ "$#" -eq 2 ]; then
	sql_args=" -P $PORT -u $USERNAME -p$PASSWORD"
else
	sql_args=" -P $PORT -h $IP_ADDRESS -u $USERNAME -p$PASSWORD"
fi

echo "Starting..."
echo "Exporting cloud dump..."
mysqldump $sql_args cloud  > $LOCATION/cloud.sql
if [ $? -eq 0 ]; then
	echo "SQLdump for cloud database extracted successfully."
else
	echo "ERROR: Failed to generate cloud database. Fix the above error and run again"
	exit 2
fi

echo "Extracting cloud_usage.."
mysqldump $sql_args cloud_usage > $LOCATION/cloud_usage.sql
if [ $? -eq 0 ]; then
	echo "SQLdump for cloud_usage database extracted successfully."
else
	echo "ERROR: Failed to generate cloud database. Fix the above error and run again"
	exit 2
fi

tar -cvzf ace_acsdump.tar.gz $LOCATION/cloud.sql $LOCATION/cloud_usage.sql
echo "Completed.."
echo "====================================================================="
echo "You can upload ace_acsdump.tar.gz file to ACE portal and get insights."
exit 0
