FROM node:4

# Base tool install
RUN apt-get update
RUN apt-get install -y wget
RUN npm install -g forever

# Add current directory

RUN mkdir /apps && mkdir /apps/cy-net-share
WORKDIR /apps/cy-net-share
ADD . /apps/cy-net-share/
ADD ./api_key.txt /apps/cy-net-share/node-app/

# Download pre-built client
WORKDIR /apps/cy-net-share/node-app/
RUN wget "http://chianti.ucsd.edu/~kono/ci/app/cy-net-share/public.tar.gz"
RUN tar xfvz public.tar.gz

RUN npm install

EXPOSE 3000
CMD ["forever","./bin/www"]