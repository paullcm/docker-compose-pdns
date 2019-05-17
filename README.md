# docker-compose-pdns
PowerDNS in Docker container.

#### You can use this file to solve the following:
* Easily build and run a DNS server
* hosts file do not name resolve DNS record types(CNAME, MX and more..)

#### Features:
- PowerDNS Recursor & Authoritative Server
- WebFronend: DjangoPowerDNS
- Data persistent
  - backend: Mariadb
- Monitoring
  - Prometheus
  - Grafana

##### Notice:
- Only allow connect localhost(127.0.0.1)
  - see `.env` file
    - `ALLOW_IPADDR` 

## Installation
git clone this repository.
```bash
$ git clone https://github.com/m120/docker-compose-pdns
```

## Usage
### Start PowerDNS server:
```bash
$ docker-compose up -d
```

### Add Domain
#### 01: Go DjangoPowerDNS management site:  
- http://127.0.0.1:8053/
  - Username: `admin`
  - Password: `admin`

`Add Domains`

#### 02: Add `forward-zones-file`
- ./pdns/conf/forward-zones-file:
  - *Not Change `172.53.1.1:5300`*
  ```
  +example.com=172.53.1.1:5300
  ```
- restart pdns_recursor: 
  ```bash
  $ docker-compose restart pdns_recursor
  ```

### Check:
#### DNS Query Check (Use: dig or nslookup)
```
$ dig {Added DNS Record} @127.0.0.1
```

### Setting local resolver
#### Settign for OS DNS Resolver `127.0.0.1`
For MacOS: 
- Step1: `System Preferences`
- Step2: Chose your Network
  - Ex: `Wi-Fi`
- Step3: `Advanced...` -> `DNS` -> `DNSServer`
  - `127.0.0.1`

*MacOSCLI: http://osxdaily.com/2015/06/02/change-dns-command-line-mac-os-x/*



## pdns Status
- pdns status   
  - http://127.0.0.1:8081/

- pdns recursor status   
  - http://127.0.0.1:8082/

## Grafana
- http://127.0.0.1:3000

- Login is
  - username: `admin`
  - password: `admin`

### prometheus
- http://127.0.0.1:9090

## Trouble shooting
### cache flush
- resursor:
  ```
  $ docker-compose exec pdns_recursor rec_control wipe-cache
  ```

- pdns AuthoritativeServer
  ```
  $ docker-compose exec pdns pdns_control purge
  ```

## Todos
- [x] graphite -> Prometheus (with grafana)
  - [x] persistent
- [ ] Update readme.md... 
- [ ] cache env
- [ ] Docker Network refactoring