FROM python:3
WORKDIR /usr/src/app
MAINTAINER Maria Jesús Alloza Rodríguez 'mariajesus.allozarodriguez@gmail.com'
RUN apt-get install git && pip install --root-user-action=ignore --upgrade pip && pip install --root-user-action=ignore django mysqlclient
ADD django_tutorial/ /usr/src/app
ADD django_polls.sh /opt
RUN mkdir statis && chmod +x /opt/django_polls.sh
ENV ALLOWED_HOSTS=*
ENV HOST=mariadb
ENV USUARIO=django
ENV CONTRA=django
ENV BASE_DATOS=django
ENV DJANGO_SUPERUSER_PASSWORD=admin
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@example.org
ENTRYPOINT ["/opt/django_polls.sh"]
