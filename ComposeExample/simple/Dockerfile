FROM python:3.6.4-alpine
ARG buildno
ADD . /code
WORKDIR /code
RUN echo "$buildno"
RUN pip install -r requirements.txt
CMD ["python" , "app.py"]