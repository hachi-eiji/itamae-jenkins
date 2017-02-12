require 'serverspec'
require 'docker'

set :backend, :docker
set :docker_url, ENV["DOCKER_HOST"]
image = Docker::Image.build_from_dir('.')
set :docker_image, image.id
set :os, family: :amazon
sleep 0.5

Excon.defaults[:ssl_verify_peer] = false
# https://github.com/swipely/docker-api/issues/106
Excon.defaults[:write_timeout] = 1000
Excon.defaults[:read_timeout] = 1000
