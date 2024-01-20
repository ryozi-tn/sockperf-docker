FROM debian:bookworm-slim as builder
RUN apt update && apt install -y git perl make automake autoconf m4 libtool-bin g++
RUN git clone https://github.com/Mellanox/sockperf
ARG TAG=HEAD
RUN cd sockperf && git checkout "$TAG" && ./autogen.sh && ./configure && make -j4

FROM gcr.io/distroless/cc-debian12 as runner
COPY --from=builder /sockperf/sockperf /usr/bin/sockperf

EXPOSE 11111
ENTRYPOINT ["/usr/bin/sockperf"]