FROM centos:latest

COPY ./t.sh /t.sh

RUN chmod 777 /t.sh

CMD ["/bin/sh", "-c", "while true; do sleep 1; bash /t.sh; done"]