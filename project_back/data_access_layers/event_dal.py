from project_back.config import HOST, USER, PASSWORD, DB
from psycopg2 import connect, Error


class DataBaseEvent(object):
    def __init__(self):
        self.connection = connect(
            host=HOST,
            user=USER,
            password=PASSWORD,
            database=DB,
            port=5432
        )

    @staticmethod
    def get_all_data_events():
        try:
            connection = DataBaseEvent().connection
            cursor = connection.cursor()

            query = f''' SELECT id,name,location,
                         date,time,
                         current_amount, goal_amount, description, id_user
                         FROM event
                         WHERE isdelete != 1; '''

            cursor.execute(query)
            data = cursor.fetchall()
            cursor.close()
            connection.close()
            return data
        except Error as e:
            return 404

    @staticmethod
    def register_event(name,
                          location,
                          date,
                          time,
                          goalAmount,
                          description,
                          organizerId):
        try:
            connection = DataBaseEvent().connection
            cursor = connection.cursor()
            query = f''' INSERT INTO event (name, location, date, time, goal_amount, description, id_user)
                             VALUES ('{name}', '{location}', '{date}', '{time}', '{goalAmount}', '{description}','{organizerId}') '''

            cursor.execute(query)
            connection.commit()
            cursor.close()
            connection.close()
            return {"message": 200}
        except Error as e:
            return {"message": f"{e}"}

    @staticmethod
    def delete_event(id_event):
        try:
            connection = DataBaseEvent().connection
            cursor = connection.cursor()

            query = f''' UPDATE event SET 
                                     IsDelete = {1}
                                     WHERE id = {id_event};'''

            cursor.execute(query)
            connection.commit()
            cursor.close()
            connection.close()
            return {"message": 200}
        except Error as e:
            return {"message": f"{e}"}
