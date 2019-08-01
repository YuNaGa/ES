FROM centos:latest

RUN curl https://d3g5vo6xdbdb9a.cloudfront.net/yum/opendistroforelasticsearch-artifacts.repo -o /etc/yum.repos.d/opendistroforelasticsearch-artifacts.repo && \
    yum update -y && \
    yum install -y java-11-openjdk-devel opendistroforelasticsearch-kibana 


COPY ./kibana.yml /etc/kibana/kibana.yml




EXPOSE 5601

CMD ["/usr/share/kibana/bin/kibana"]
#CMD ["/bin/sh", "-c", "while true; do sleep 1; sleep 1; done"]
