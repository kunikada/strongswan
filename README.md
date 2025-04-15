# strongSwan Docker Setup

このプロジェクトは、[strongSwan](https://www.strongswan.org/) VPN サーバーを Docker コンテナで簡単にセットアップするためのものです。

## 必要条件

- Docker および Docker Compose がインストールされていること。

## セットアップ手順

1. このリポジトリをクローンします。

   ```bash
   git clone <repository-url>
   cd strongswan
   ```

2. 証明書と秘密鍵を用意します。

   - サーバー証明書 (`server-cert.pem`) と秘密鍵 (`server-key.pem`) を作成または取得してください。
   - 作成したファイルをプロジェクトディレクトリに配置します。

3. 設定ファイルを確認します。

   - `swanctl.conf`:
     strongSwan の設定ファイルです。必要に応じて修正してください。

4. Docker Compose を使用してコンテナを起動します。

   ```bash
   docker-compose up -d
   ```

5. VPN クライアントを設定し、`vpn.example.com` に接続します。

## ポート

以下のポートが公開されます。

- `500/udp`: IKE ポート。
- `4500/udp`: NAT トラバーサル用ポート。

## 注意事項

- 本番環境では、必ず強力なパスワードを使用してください。
- 証明書と秘密鍵も適切に保護してください。

## ライセンス

このプロジェクトは [MIT ライセンス](LICENSE) の下で提供されています。
