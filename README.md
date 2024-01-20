sockperf on docker
==========

sockperf: https://github.com/Mellanox/sockperf


Usage
----------------

```bash
# Server: Listen
docker run --rm -p 11111/tcp 11111/udp ryozitn/sockperf:3.10 server -i 0.0.0.0

# Client: 
docker run --rm ryozitn/sockperf:3.10 under-load --mps 10000 -m 128 -t 10 -i SERVER-IP
```

### Build

```bash
docker build -t ryozitn/sockperf .
```
