# ssh-apache
# clone the project:
git clone https://github.com/Staska45/ssh-apache
# go to ssh-apache/docker_new directory and run:
docker-compose build
# start container:
docker-compose up -d
# to ssh to container:
chmod 600 id_rsa\
ssh -i id_rsa ssh://root@localhost:2022
# or if you want to use your own key generate it and put id_rsa.pub into ssh-apache/docker_new/keys then stop and rebuild the container:
cp /home/user/.ssh/id_rsa.pub /ssh-apache/docker_new/keys\
docker stop docker-v1\
docker-compose build\
docker-compose up -d
# apache is running on port 2080 to open php info use curl or open browser and use the url:
curl http://localhost:2080
# Files:
.env holds enviromental variables for timezone and container name(to change the name dont forget to also eddit docker-compose.yml)\
apache-config.conf apache configuration file\
supervisord.conf supervisor configuration file to start ssh\
Docker file build file for docker immage\
docker-compose.yml configures mounted volumes, ports, and entrypoint start script\
app/index.php test web page\
sh/docker_start.sh starts services and adds rsa key to authorised_keys sets up folders and pemisions\
keys/id_rsa.pub your public key\
id_rsa and id_rsa.pub your public and private key\
# Website:
you can add files to your ssh-apache/docker_new/app even while the container is running to add extra pages
