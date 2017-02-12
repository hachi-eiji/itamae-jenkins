FROM hachiyae/rbenv-on-amzn-linux:latest

MAINTAINER Eiji Hachiya<hachiyae@gmail.com>

WORKDIR /itamae
COPY ./itamae .

RUN yum -y update \
  && bash -l bundle install --path .vendor/bundle \
  && bash -l bundle exec itamae local --node-yaml node.yml ./roles/php-server.rb

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
