FROM dockerfile/nodejs

 
#Installing Loopback
RUN apt-get install -y git
RUN npm install -g grunt-cli express forever yo bower

# Cloe the latest cyNetShare code
RUN mkdir /data/app
WORKDIR /data/app

RUN git clone https://github.com/idekerlab/cy-net-share.git
WORKDIR /data/app/cy-net-share
RUN git submodule init

# This is a bit hackey, but need to edit remote repo location to http.
RUN sed -i -e 's/git@github.com:cytoscape\/cyjs-sample.git/https:\/\/github.com\/cytoscape\/cyjs-sample.git/' .gitmodules
RUN git submodule sync
RUN git submodule update
WORKDIR /data/app/cy-net-share/cyjs-sample
RUN npm install
RUN bower update --allow-root
RUN grunt --force

EXPOSE 3000

WORKDIR /data/app/cy-net-share/node-app
CMD forever ./bin/www