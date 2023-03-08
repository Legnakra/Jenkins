FROM python:3
WORKDIR /usr/src/app
MAINTAINER Maria Jesús Alloza Rodríguez 'mariajesus.allozarodriguez@gmail.com'
RUN apt-get install git && pip install --root-user-action=ignore --upgrade pip && pip install --root-user-action=ignore django mysqlclient
RUN git clone https://github.com/Legnakra/Jenkins.git /usr/src/app && mkdir static
ADD ./django_polls.sh /usr/src/app
RUN chmod +x /usr/src/app/django_polls.sh
ENV DJANGO_SUPERUSER_EMAIL=admin@example.org
ENTRYPOINT ["/usr/src/app/django_polls.sh"]
