FROM python:3.11.1-alpine

WORKDIR /app

RUN pip install fastapi "uvicorn[standard]" psycopg2-binary
ADD app.py /app/app.py

EXPOSE 80

ENTRYPOINT ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "80"]
