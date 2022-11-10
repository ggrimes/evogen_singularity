FROM ubuntu
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y unzip \
  && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/wdecoster/cramino/releases/download/v0.9.4/cramino-linux.zip
RUN unzip cramino-linux.zip
RUN chmod 755 cramino
RUN mv cramino /usr/bin
