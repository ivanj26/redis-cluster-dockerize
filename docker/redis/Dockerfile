FROM redis:latest

RUN apt-get -y update && apt-get -y install default-jre curl unzip
RUN curl -L https://github.com/redis-developer/riot/releases/download/v2.18.5/riot-redis-2.18.5.zip > riot-redis.zip
# RUN unzip riot-redis.zip