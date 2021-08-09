FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    ca-certificates \
    build-essential \
    apt-transport-https \
    git \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y \
    nodejs
WORKDIR /app
RUN git clone https://github.com/xops/expedition.git
WORKDIR /app/expedition
EXPOSE 3000
CMD npm install && npm start
# docker build -t expedition:1.0.0 .
# docker run -d \
# --name=myzap \
# --restart=always \
# -v /etc/localtime:/etc/localtime:ro \
# -p 3000:3000 \
# expedition:1.0.0