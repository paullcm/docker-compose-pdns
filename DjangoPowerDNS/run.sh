python ./DjangoPowerDNS/manage.py migrate
python ./DjangoPowerDNS/manage.py shell -c "from django.contrib.auth.models import User; User.objects.create_superuser('__NAME__', '__EMAIL__', '__PASSWORD__')"
python ./DjangoPowerDNS/manage.py runserver 0.0.0.0:8053