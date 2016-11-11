# docker-compose-pdns
DockerCompose for PowerDNS(recursor, backend MySQL(MariaDB)) with PowerDNS-Admin and MariaDB

以下を解決できるはず！
* 手軽にDNSサーバを立てたい
* hostsだとcnameが使えない

# 起動(How to launch)
```
$ docker-compose up -d
```

# 使い方 (How to use)
## Memo
- 特にドメインやレコードを登録しなくても、recusorでGoogle Public DNSに問い合わせてくれる。
- localhostのみしか接続を許可していない

## 1. ドメインやレコードを登録   
 http://127.0.0.1:9393/   
  - Username: admin   
  - Password: admin   
  - OTP Token:   

詳しい使い方は、PowerDNSAdminを参照   
https://github.com/ngoduykhanh/PowerDNS-Admin



## 2. digやnslookupで確認
```
$ dig 登録したレコード @127.0.0.1
```

## 3. DNSを127.0.0.1に変更する
OSのDNS設定を変更する

## その他
### pdsnのstatus   
 - http://127.0.0.1:8081/
