from flask import Flask
import redis
import psycopg2

app = Flask(__name__)

# Connection à Redis
redis_client = redis.StrictRedis(host='redis', port=6379)

@app.route('/')
def hello_flask():
    redis_client.incr('flask_hits')
    hits = redis_client.get('flask_hits').decode('utf-8')
    return f"Bonjour depuis Flask! Cette page a été vue {hits} fois."

# Appel pgsql
@app.route('/postgres')
def call_postgres():
    try:
        conn = psycopg2.connect(
            dbname="postgresdb",
            user="postgres",
            password="Sup!nf0",
            host="postgres",
            port=5432
        )
        cursor = conn.cursor()
        cursor.execute("SELECT NOW();")
        result = cursor.fetchone()
        conn.close()
        return f"PostgreSQL a répondu avec : {result[0]}"
    except Exception as e:
        return str(e)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)