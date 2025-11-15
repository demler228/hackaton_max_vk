from project_back.data_access_layers.event_dal import DataBaseEvent
from project_back.data_access_layers.user_dal import DataBaseUser
from project_back.bussines_logic.volunteer_list_bl import VolunteerList

class Event(object):

    @staticmethod
    def refactor_event_for_json():
        data = DataBaseEvent.get_all_data_events()
        if data != 404:
            event_list = []
            for event in data:
                event_list.append({'id': event[0],
                                   "name": event[1],
                                   "location": event[2],
                                   "date": event[3].isoformat(),
                                   "time": event[4].isoformat(),
                                   "currentAmount": float(event[5]),
                                   "goalAmount": float(event[6]),
                                   "description": event[7],
                                   "organizerName": DataBaseUser.get_name_for_id(event[8]),
                                   "organizerId": event[8],
                                   "volunteerList": VolunteerList.refactor_volunteers_for_json(event[0])})
            return event_list
        else:
            return []
