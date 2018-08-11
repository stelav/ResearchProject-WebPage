FROM r-base:3.5.1
RUN apt-get update && apt-get install -y python3

COPY site_stephen /app/site_stephen/
COPY *.* /app/

WORKDIR /app/

RUN apt-get install -y python3-pip && pip3 install -r requirements.txt && \
    apt-get install bash && \
    apt-get -y install nginx libxml2-dev libssl-dev libcurl4-openssl-dev && \
    mkdir /run/nginx && \
    pip3 install --editable .
#apt-get -y build-dep libcurl4-gnutls-dev
#apt-get -y install libcurl4-gnutls-dev

#ENV FLASK_ENV=development

COPY app/site.conf /etc/nginx/conf.d
COPY app/site.initd /etc/init.d/site

EXPOSE 3168 5000

RUN ["chmod", "+x", "/etc/init.d/site"]

CMD ["/etc/init.d/site", "start"]
#CMD ["python3", "-m", "pdb", "site_stephen/main.py"]