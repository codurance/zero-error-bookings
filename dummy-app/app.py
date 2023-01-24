from fastapi import FastAPI
import psycopg2

conn = psycopg2.connect(
    database="db",
    host="postgres",
    user="admin",
    password="password",
    port="5432"
)

app = FastAPI()


@app.get("/")
def get_users():
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM users;")
    return cursor.fetchall()
