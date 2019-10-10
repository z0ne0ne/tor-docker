# tor-docker

tor service with nyx in a docker container.

For simple use tor and nyx run in a container. The docker container let you run your own tor relay node.

## Usage - pre-configured

Everything is pre-configured. Some details:

### Default configuration

- The default configuration is ***no exit relay***.

- Nickname: Unnamed

- ORPort: 9001

- DirPort: 9030

- SOCKSPort: 9050

- ControlPort: 9051

- RelayBandwidthRate: 75KB

- RelayBandwidthBurst: 150KB

- AccountingMax: 40 GBytes

- AccountingStart: day 00:00

- AccountingStart: month 1 00:01


### Ports

Open the following ports to access them from the outside:

- 9001
- 9030

The ports 9050 and 9051 don't have to be opened to the outside.

### Container

If you want to start with the default settings:

> git pull z0ne0ne/tor-docker
> docker run -d --rm --name tor -p 9001:9001 -p 9030:9030 -p 9050:9050 -p 9051:9051 docker-tor

### nyx

nyx is a tool to monitor your tor service. Start a shell in your running container and start nyx. The UI is pretty simple.

> docker exec -it tor sh
> nyx


## Usage - customized

> git clone https://github.com/z0ne0ne/tor-docker.git
> cd tor-docker
> cp torrc.default torrc

Adapt the torrc to your needs and start the container. The local directory will be linked into the /etc/tor directory and your configuration will be enforced.

> docker run -d --rm --name tor -p 9001:9001 -p 9030:9030 -p 9050:9050 -p 9051:9051 --volume ${PWD}:/etc/tor docker-tor


### nyx

nyx is a tool to monitor your tor service. Start a shell in your running container and start nyx. The UI is pretty simple.

> docker exec -it tor sh
> nyx


Have fun!
