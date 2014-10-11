FROM google/python

WORKDIR /app
RUN virtualenv /env
RUN echo "source /env/bin/activate" >> ~/.bashrc

ADD requirements.txt /app/requirements.txt
RUN /env/bin/pip install -r requirements.txt
ADD . /app

CMD []
ENTRYPOINT ["/env/bin/python", "/app/main.py"]

