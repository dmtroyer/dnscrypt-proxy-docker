FROM alpine:3.15

ARG DNSCRYPT_PROXY_VERSION=2.1.1

RUN wget -O dnscrypt-proxy.tar.gz https://github.com/DNSCrypt/dnscrypt-proxy/releases/download/${DNSCRYPT_PROXY_VERSION}/dnscrypt-proxy-linux_x86_64-${DNSCRYPT_PROXY_VERSION}.tar.gz \
  && mkdir -p /opt/dnscrypt-proxy \
  && tar -xzvf dnscrypt-proxy.tar.gz --directory /opt/dnscrypt-proxy --strip-components=1 \
  && rm dnscrypt-proxy.tar.gz

EXPOSE 53/tcp
EXPOSE 53/udp

ENTRYPOINT ["/opt/dnscrypt-proxy/dnscrypt-proxy"]
