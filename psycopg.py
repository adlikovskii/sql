import psycopg2


def delete_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
                DROP TABLE phone;
                DROP TABLE client;
                """)
        conn.commit()


def create_db(conn):
    with conn.cursor() as cur:
        cur.execute("""
                CREATE TABLE IF NOT EXISTS client(
                    id SERIAL PRIMARY KEY,
                    first_name VARCHAR(40),
                    last_name VARCHAR(40),
                    email VARCHAR(40) UNIQUE
                );
                """)
        cur.execute("""
                CREATE TABLE IF NOT EXISTS phone(
                    id SERIAL PRIMARY KEY,
                    phone BIGSERIAL UNIQUE,
                    client INTEGER REFERENCES client(id)
                );
                """)
        conn.commit()


def add_client(conn, first_name, last_name, email, phone=None):
    with conn.cursor() as cur:
        cur.execute("""
                INSERT INTO client(first_name, last_name, email) VALUES(%s, %s, %s) RETURNING id;
                """, (first_name, last_name, email))
        client_id = cur.fetchone()[0]
        if phone:
            add_phone(conn, client_id, phone)
        conn.commit()


def add_phone(conn, client_id, phone):
    with conn.cursor() as cur:
        cur.execute("""
                    INSERT INTO phone(phone, client) VALUES(%s, %s);
                    """, (phone, client_id))
        conn.commit()


def change_client(conn, client_id, first_name=None, last_name=None, email=None, old_phone=None, new_phone=None):
    with conn.cursor() as cur:
        if first_name:
            cur.execute("""
                    UPDATE client SET first_name=%s WHERE id=%s;
                    """, (first_name, client_id))
        if last_name:
            cur.execute("""
                    UPDATE client SET last_name=%s WHERE id=%s;
                    """, (last_name, client_id))
        if email:
            cur.execute("""
                    UPDATE client SET email=%s WHERE id=%s;
                    """, (email, client_id))
        if old_phone and new_phone:
            cur.execute("""
                        UPDATE phone SET phone=%s WHERE phone=%s;
                        """, (new_phone, old_phone))
        conn.commit()


def delete_phone(conn, client_id=None, phone=None):
    with conn.cursor() as cur:
        if client_id:
            cur.execute("""
                    DELETE FROM phone WHERE client=%s;
                    """, (client_id,))
        if phone:
            cur.execute("""
                        DELETE FROM phone WHERE phone=%s;
                        """, (phone,))
    conn.commit()


def delete_client(conn, client_id):
    with conn.cursor() as cur:
        cur.execute("""
                    DELETE FROM phone WHERE client=%s;
                    """, (client_id,))
        cur.execute("""
                    DELETE FROM client WHERE id=%s;
                    """, (client_id,))
    conn.commit()


def find_client(conn, first_name=None, last_name=None, email=None, phone=None):
    with conn.cursor() as cur:
        if phone:
            cur.execute("""
                    SELECT client FROM phone WHERE phone=%s;
                    """, (phone,))
            return cur.fetchone()[0]
        if email:
            cur.execute("""
                        SELECT id FROM client WHERE email=%s;
                        """, (email,))
            return cur.fetchone()[0]
        if last_name:
            cur.execute("""
                        SELECT id FROM client WHERE last_name=%s;
                        """, (last_name,))
            return cur.fetchall()[0]
        if first_name:
            cur.execute("""
                        SELECT id FROM client WHERE first_name=%s;
                        """, (first_name,))
            return cur.fetchall()[0]


with psycopg2.connect(host="localhost", database="postgres", user="postgres", password="postgres") as conn:
    """"""
conn.close()
