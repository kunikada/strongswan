FROM debian:stable-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    strongswan \
    strongswan-pki \
    && rm -rf /var/lib/apt/lists/*

# 設定ファイルをコピー
COPY ipsec.conf /etc/ipsec.conf
COPY ipsec.secrets /etc/ipsec.secrets

EXPOSE 500/udp 4500/udp

CMD ["ipsec", "start", "--nofork"]