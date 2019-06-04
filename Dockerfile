FROM alpine:3.9

ENV PATH $PATH:/usr/bin/python3
EXPOSE 8000

ADD requirements.txt .

RUN apk add python3 && \
    apk add curl && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python3 ./get-pip.py && \
    ls && \
    pip install -r ./requirements.txt

RUN mkdir /flower
WORKDIR /flower

CMD ["python3", "./manage.py", "runserver", "0.0.0.0:8000"]
