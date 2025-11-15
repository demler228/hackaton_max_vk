from psycopg2 import connect, Error

from project_back.config import HOST, USER, PASSWORD, DB


class DataBaseVolunteerList(object):
    def __init__(self):
        self.connection = connect(
            host=HOST,
            user=USER,
            password=PASSWORD,
            database=DB,
            port=5432
        )

    @staticmethod
    def get_volunteer_for_id_event(id_event):
        try:
            connection = DataBaseVolunteerList().connection
            cursor = connection.cursor()

            query = f''' SELECT id_user
                         FROM volunteer_list
                         WHERE id_event = {id_event}; '''

            cursor.execute(query)
            data = cursor.fetchall()
            cursor.close()
            connection.close()
            return data
        except Error as e:
            return {"data": f"{e}"}

    @staticmethod
    def add_data_register(id_user, id_event):
        try:
            connection = DataBaseVolunteerList().connection
            cursor = connection.cursor()

            # Проверяем существование комбинации id_user и id_event
            check_query = '''SELECT * FROM volunteer_list WHERE id_event=%s AND id_user=%s'''
            cursor.execute(check_query, (id_event, id_user))
            existing_record = cursor.fetchone()

            if existing_record:
                # Запись уже существует
                return {'message': 'Такая запись уже существует'}
            else:
                # Записи нет, добавляем новую
                insert_query = '''INSERT INTO volunteer_list (id_event, id_user) VALUES (%s, %s)'''
                cursor.execute(insert_query, (id_event, id_user))
                connection.commit()

            cursor.close()
            connection.close()
            return {"message": 200}
        except Exception as e:
            return {'message': str(e)}
