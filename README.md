scripts
=======

Cloud Platform Dumps

========================================================================================================================

Use acsdump.sh script to generate cloud stack database dump.

Format: sh acsdump.sh sql_username sql_user_password [sql_server_ip]

This will generate a compressed file: ace_acsdump.tar.gz. You can upload this file to ACE and analyze and get insights.

========================================================================================================================

If you would like to generate the dump manually, follow the steps:

1) mysqldump -h your_sql_host -u sql_user -p cloud  > cloud.sql
2) mysqldump -h your_sql_host -u sql_user -p cloud_usage  > cloud_usage.sql
3) tar cvfz cloudstack.tar.gz cloud.sql cloud_usage.sql
4) you can now use cloudstack.tar.gz file in actoncloud.
