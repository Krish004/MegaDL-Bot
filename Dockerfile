#FROM debian:latest

#RUN apt update && apt upgrade -y
#RUN apt install git curl python3-pip ffmpeg -y
#RUN pip3 install -U pip
#RUN cd /
#RUN git clone https://github.com/krish004/MegaDL-Bot
#RUN cd MegaDL-Bot
#WORKDIR /MegaDL-Bot
#RUN pip3 install -U -r requirements.txt
#CMD python3 main.py
FROM python:3.8-slim-buster

RUN apt update && apt upgrade -y
RUN apt install git -y
COPY requirements.txt /requirements.txt

RUN cd /
RUN pip3 install -U pip && pip3 install -U -r requirements.txt
WORKDIR /app

COPY . .

CMD ["python", "main.py"]
