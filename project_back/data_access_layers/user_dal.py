from project_back.config import HOST, USER, PASSWORD, DB
from psycopg2 import connect, Error


class DataBaseUser(object):
    def __init__(self):
        self.connection = connect(
            host=HOST,
            user=USER,
            password=PASSWORD,
            database=DB,
            port=5432
        )

    @staticmethod
    def get_name_for_id(id_user):
        try:
            connection = DataBaseUser().connection
            cursor = connection.cursor()

            query = f''' SELECT name
                         FROM users
                         WHERE id = {id_user}; '''

            cursor.execute(query)
            data = cursor.fetchall()
            cursor.close()
            connection.close()
            return data[0][0]
        except Error as e:
            return e