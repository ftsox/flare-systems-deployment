## Ubuntu 22.04 fresh instance

# connect to instance
ssh -i ~/.ssh/migrated/id_rsa root@188.166.124.133

# update to latest
sudo apt update

# install nvm and activate in shell
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# install node version 18.X
nvm install --lts=hydrogen

# install yarn
npm install -g yarn

# install dependencies

# # jq
# sudo apt install jq

# docker
# https://docs.docker.com/engine/install/ubuntu/

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install latest version
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# # Install Docker Compose
# sudo apt-get install docker-compose-plugin


## Clone repo
git clone https://github.com/flare-foundation/fdc-suite-deployment.git
cd fdc-suite-deployment/


#### SEE ~/Projects/Flare/fdc-suite on Macbook Pro for current version

# # Set up .env file
# nano .env
# # copy in file

# # if applicable, modify docker compose file to include the feed value provider

# # populate configs
# ./populate_config.sh

# # run docker compose
# sudo docker compose up -d

# # useful commands
# sudo docker compose ps  # should show 6 containers running, one for each in docker-compose.yml
# sudo docker compose ls
# sudo docker compose logs
# sudo docker logs ftso-v2-deployment-client 
# # sudo docker compose logs --follow --tail 100 flare-systems-deployment-ftso-client-1
# # sudo docker logs --follow --tail 100 flare-systems-deployment-ftso-client-1
#   # flare-systems-deployment-system-client-1
#   # flare-systems-deployment-feed-value-provider-1
#   # flare-systems-deployment-ftso-client-1
#   # flare-systems-deployment-c-chain-indexer-1
# sudo docker system df
# sudo docker volume ls
# # sudo docker compose down


# ## Database is persisted in a named docker volume. If you need to wipe database you need to remove the volume manually.
# ## When codebase is changed new images need to be pulled:
# # docker compose pull

# # ## Full list of update commands
# # git pull
# # ./populate_config.sh
# # docker compose pull
# # docker compose up -d



# ### Adding space to volumes
# # Ensuring that volumes created from snapshots get their full size
# # https://docs.digitalocean.com/products/droplets/how-to/resize/#verifying-disk-resizes
# # https://www.digitalocean.com/community/questions/disk-size-not-enlarged-after-upgrade - not the actual solution
# df -h   # gives system recognized size
# lsblk   # gives actual size
# df -Th /dev/sda # gives file system (presuming the volume is mounted on /dev/sda) - confirm if it is ext3/4 or XFS
# # gdisk -l /dev/sda

# resize2fs /dev/sda
# # growpart /dev/sda 1
