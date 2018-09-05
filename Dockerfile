FROM python:3.6-alpine3.6

RUN mkdir -p /opt/pi-k8s

WORKDIR /opt/pi-k8s

ADD requirements.txt .

RUN pip install -r requirements.txt

ADD openapi openapi
ADD bin bin
ADD lib lib
ADD test test

ENV PYTHONPATH "/opt/pi-k8s/lib:${PYTHONPATH}"

CMD "/opt/pi-k8s/bin/api.py"
