#!/bin/bash
which curl ; if [ $? -gt 0];
then
  echo "Please install curl in order to download redis distr."
else
    curl -O http://download.redis.io/releases/redis-5.0.8.tar.gz
    tar xzf redis-5.0.8.tar.gz
    cd redis-5.0.8
    make
    cd .. && rm -rf redis-5.0.8.tar.gz
fi

