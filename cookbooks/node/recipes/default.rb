#
# Cookbook Name:: node
# Recipe:: default
#
# Copyright 2014, Keiichiro Ono
#
# All rights reserved - Do Not Redistribute
#
# For nodejs applications
#


execute "apt-get update"

package "nodejs"
package "npm"
package "nodejs-legacy"

execute "npm install express -g"
execute "npm install express-generator -g"
execute "npm install forever -g"
execute "npm install yo -g"

execute "express /vagrant/node-app -e"
