FROM debian:stable-slim

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    strongswan \
    strongswan-swanctl \
    && rm -rf /var/lib/apt/lists/*

# 設定ファイルをコピー
COPY swanctl.conf /etc/swanctl/swanctl.conf

EXPOSE 500/udp 4500/udp

CMD ["sh", "-c", "swanctl --load-creds && swanctl --non-interactive --load-all"]