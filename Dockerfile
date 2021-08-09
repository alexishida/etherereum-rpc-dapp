# Create account 
# Public address of the key:   0x64E3845EC410F709a6cD90b9b67F24f55C3192fB
# Path of the secret key file: .ethereum/keystore/UTC--2021-08-05T16-57-01.074763601Z--64e3845ec410f709a6cd90b9b67f24f55c3192fb

# Public address of the key:   0x709e299a35c8035Fa78a3DbfcBb28ee24D81d119
# Path of the secret key file: .ethereum/keystore/UTC--2021-08-05T16-58-09.250332180Z--709e299a35c8035fa78a3dbfcbb28ee24d81d119

# user

# geth account new --datadir /root/.ethereum

# Create a genesis block
# geth -datadir /root/.ethereum init /root/.ethereum/user.json

# Params
# chainid: 23285
# Password: user
FROM ubuntu:20.04

RUN apt-get update

RUN apt-get install -y apt-utils
RUN apt-get install software-properties-common -y

RUN apt-get install -y locales locales-all

ENV LC_ALL pt_BR.UTF-8
ENV LANG pt_BR.UTF-8
ENV LANGUAGE pt_BR.UTF-8


RUN add-apt-repository -y ppa:ethereum/ethereum
RUN apt-get install ethereum -y

RUN apt-get autoremove -y && apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /root/.ethereum
COPY ./dados/ethereum/* /root/.ethereum/
COPY ./dados/start.sh /

# TCP, used by the HTTP based JSON RPC API
EXPOSE 8545 

# TCP, used by the WebSocket based JSON RPC API
EXPOSE 8546 

# TCP, used by the GraphQL API
EXPOSE 8547

# TCP and UDP, used by the P2P protocol running the network
EXPOSE 30303

CMD ["/bin/bash", "/start.sh"]