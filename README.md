sockperf on docker
==========

Provides a docker image for sockperf.

sockperf: https://github.com/Mellanox/sockperf

Docker build source: https://github.com/ryozi-tn/sockperf-docker

Usage
----------------

```bash
# Server: Listen
docker run --rm -p 11111/tcp 11111/udp ryozitn/sockperf:3.10 server -i 0.0.0.0

# Client
docker run --rm ryozitn/sockperf:3.10 under-load --mps 10000 -m 128 -t 10 -i SERVER-IP
```


Why This Image?
-----

This Docker image meets the following requirements:

- Latest Build: Includes the latest build as of January 2024.
- Synchronized with Project Tags: Synchronized with the project tags for easy version management.
- Compact Image: Small in size for fast downloading and launching.
