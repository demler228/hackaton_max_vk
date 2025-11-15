from project_back.data_access_layers.volunteer_list_dal import DataBaseVolunteerList
from project_back.data_access_layers.user_dal import DataBaseUser


class VolunteerList(object):

    @staticmethod
    def refactor_volunteers_for_json(id_event):
        data = DataBaseVolunteerList.get_volunteer_for_id_event(id_event)
        flag = isinstance(data, list)
        if flag == True:
            volunteer_list = []
            for volunteers in data:
                volunteer_list.append({"id_user": volunteers[0],
                                       "name_user": DataBaseUser.get_name_for_id(volunteers[0]),
                                       })
            return volunteer_list
        else:
            return data["data"]
