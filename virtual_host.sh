echo "Server Name (example.com)"
read serverName
echo "Server Alias (example.com)"
read serverAlias
echo "Server Admin (admin@example.com)"
read serverAdmin
echo "Document Root"
read documentRoot
cp template.conf "$serverName.conf"
sed -i "s/{serverName}/$serverName/g" "$serverName.conf"
sed -i "s/{serverAlias}/$serverAlias/g" "$serverName.conf"
sed -i "s/{serverAdmin}/$serverAdmin/g" "$serverName.conf"
sed -i "s/{documentRoot}/${documentRoot//\//\\/}/g" "$serverName.conf"