FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron
RUN apt install curl -y

ADD cron /etc/cron.d/cron_test
ADD script.sh /etc/cron.d/script.sh
RUN chmod 777 /etc/cron.d/script.sh
RUN chmod 0644 /etc/cron.d/cron_test

RUN crontab /etc/cron.d/cron_test
RUN touch /var/log/cron.log
CMD cron && tail -f /dev/null
