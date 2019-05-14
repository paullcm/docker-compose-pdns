# docker-compose-pdns
PowerDNS in Docker container with WebFrontend DjangoPowerDNS and Backend MariaDB.

You can use this file to solve the following:
* Easily build and run a DNS server
* hosts file do not name resolve DNS record types(CNAME, MX and more..)

Notice:
- Only allow connect localhost(127.0.0.1)

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

### Go DjangoPowerDNS management site:  
- http://127.0.0.1:8053/
  - Username: `admin`
  - Password: `admin`

#### Next Step:
##### 2. DNS Query Check (Use: dig or nslookup)
```
$ dig {Added DNS Record} @127.0.0.1
```

##### 3. Settign for OS DNS Resolver `127.0.0.1`
For MacOS: 
- Step1: `System Preferences`
- Step2: Chose your Network
  - Ex: `Wi-Fi`
- Step3: `Advanced...` -> `DNS` -> `DNSServer`
  - `127.0.0.1`


## Memo
- pdsn status   
  - http://127.0.0.1:8081/
