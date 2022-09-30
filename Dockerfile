FROM alpine:3.15

ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN  apk update \
	&& apk add --no-cache gcc musl-dev postgresql-dev python3 py3-pip libffi-dev \
	&& pip install --upgrade pip
    

COPY ./requirements.txt ./

RUN pip install -r requirements.txt

COPY ./ ./

CMD ["python3","manage.py","runserver","0.0.0.0:8000"]