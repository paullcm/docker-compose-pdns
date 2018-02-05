import os
basedir = os.path.abspath(os.path.dirname(__file__))

# BASIC APP CONFIG
WTF_CSRF_ENABLED = True
SECRET_KEY = 'We need someone to lean on'
BIND_ADDRESS = '0.0.0.0'
PORT = 9393
LOGIN_TITLE = "PDNS"

# TIMEOUT - for large zones
TIMEOUT = 10

# LOG CONFIG
LOG_LEVEL = 'DEBUG'
#LOG_FILE = 'logfile.log'
# For Docker, leave empty string
LOG_FILE = ''

# Upload
UPLOAD_DIR = os.path.join(basedir, 'upload')

# DATABASE CONFIG
#You'll need MySQL-python
SQLA_DB_USER = 'powerdnsadmin'
SQLA_DB_PASSWORD = 'takoyaki'
SQLA_DB_HOST = 'mariadb'
SQLA_DB_NAME = 'powerdnsadmin'

#MySQL
SQLALCHEMY_DATABASE_URI = 'mysql://'+SQLA_DB_USER+':'\
    +SQLA_DB_PASSWORD+'@'+SQLA_DB_HOST+'/'+SQLA_DB_NAME

SQLALCHEMY_MIGRATE_REPO = os.path.join(basedir, 'db_repository')
SQLALCHEMY_TRACK_MODIFICATIONS = True

#Default Auth
BASIC_ENABLED = True
SIGNUP_ENABLED = True

# POWERDNS CONFIG
PDNS_STATS_URL = 'http://pdns:8081/'
PDNS_API_KEY = 'pen-pineapple-apple-pen'
PDNS_VERSION = '4.0.1'

# RECORDS ALLOWED TO EDIT
RECORDS_ALLOW_EDIT = ['A', 'AAAA', 'CNAME', 'SPF', 'PTR', 'MX', 'TXT']

# EXPERIMENTAL FEATURES
PRETTY_IPV6_PTR = False
