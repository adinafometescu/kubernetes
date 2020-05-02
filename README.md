# kubernetes
if the nexus cannot write in nexus-data, run this command
sudo chown -R 200:200 ./deployment/nexus-data

configure your .m2/settings.xml with the following:
`
<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0">
 <servers>
   <server>
      <id>nexus-snapshots</id>
      <username>admin</username>
      <password>admin123</password>
   </server>
</servers>
</settings>
`
OBS : I've changed the password from nexus ui to admin123, by default is the one located in nexus-data/admin

# install kubernetes
I've installed minikube for this demo
