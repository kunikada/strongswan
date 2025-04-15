FROM debian:stable-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    strongswan \
    libstrongswan-extra-plugins \
    libcharon-extra-plugins \
    && apt-get clean

# 設定ファイルをコピー
COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets

#ADD https://letsencrypt.org/certs/isrgrootx1.pem /etc/ipsec.d/cacerts/isrgrootx1.pem

EXPOSE 500/udp 4500/udp

CMD ["ipsec", "start", "--nofork"]