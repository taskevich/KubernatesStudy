FROM python:3.11.1-buster as builder

ENV TZ=Asia/Yekaterinburg
ENV LANG=C.UTF-8
ENV LC_ALL=C.UTF-8
ENV PYTHONUNBUFFERED=1

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY requirements.txt .

RUN pip install -r requirements.txt
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /src

COPY src .

EXPOSE 8000

CMD ["bash", "-c", "uvicorn main:app --host 0.0.0.0 --port 8000 --reload"]