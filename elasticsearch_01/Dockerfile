FROM centos:latest

RUN groupadd -g 1000 elasticsearch && \
    useradd -u 1000 -g 1000 \
    -d /usr/share/elasticsearch elasticsearch \
    -b /usr/share/elasticsearch \
    -s /bin/bash && \
    chmod 755 /usr/share/elasticsearch 



RUN yum update -y && \
    yum install java-11-openjdk-devel -y && \
    curl https://d3g5vo6xdbdb9a.cloudfront.net/yum/opendistroforelasticsearch-artifacts.repo -o /etc/yum.repos.d/opendistroforelasticsearch-artifacts.repo

RUN yum install opendistroforelasticsearch -y

COPY ./elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN chmod 660 /etc/elasticsearch/elasticsearch.yml
RUN chown -R elasticsearch:elasticsearch /etc/elasticsearch/
# DEMO Certificate
RUN chmod 600 /etc/elasticsearch/.elasticsearch.keystore.initial_md5sum \
              /etc/elasticsearch/esnode.pem \
              /etc/elasticsearch/esnode-key.pem \
              /etc/elasticsearch/root-ca.pem \
              /etc/elasticsearch/kirk.pem \
              /etc/elasticsearch/kirk-key.pem


USER 1000

#9200 HTTP Default Port (if same server, the next node will use the 9200 next port)
#9300 Node Exchange Port
#9600 Logstash Port
#5043 Beats Port
#5601 kibana Port
EXPOSE 9200 9300 9600
CMD ["/usr/share/elasticsearch/bin/elasticsearch"]


# Where are the files?
#File type	                                          | Location
#Elasticsearch home, management scripts, and plugins  |	/usr/share/elasticsearch/
#Configuration files	                              | /etc/elasticsearch
#Environment variables	                              | /etc/sysconfig/elasticsearch
#Logs	                                              | /var/log/elasticsearch
#Shard data	                                          | /var/lib/elasticsearch