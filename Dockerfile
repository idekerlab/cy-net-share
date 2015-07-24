FROM node:latest

#Installing Loopback
RUN apt-get update
RUN apt-get install -y ruby ruby-dev git
RUN gem install sass compass
RUN npm install -g grunt-cli forever yo bower

# Clone the latest cyNetShare code
RUN mkdir /data
RUN mkdir /data/app
WORKDIR /data/app

RUN git clone https://github.com/idekerlab/cy-net-share.git
WORKDIR /data/app/cy-net-share
ADD api_key.txt /data/app/cy-net-share/node-app/

RUN git submodule init

# This is a bit hackey, but need to edit remote repo location to http.
RUN sed -i -e 's/git@github.com:cytoscape\/cyjs-sample.git/https:\/\/github.com\/cytoscape\/cyjs-sample.git/' .gitmodules
RUN git submodule sync
RUN git submodule update
WORKDIR /data/app/cy-net-share/cyjs-sample
RUN npm install
RUN bower install --allow-root --config.interactive=false --force
RUN grunt --force
RUN cp -r dist ../node-app/public

EXPOSE 3000

WORKDIR /data/app/cy-net-share/node-app
RUN npm install
CMD ["forever","./bin/www"]