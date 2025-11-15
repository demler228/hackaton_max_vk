from flask import jsonify, request, Blueprint
from project_back.bussines_logic.event_bl import Event
from project_back.data_access_layers.volunteer_list_dal import DataBaseVolunteerList

volunteer_blueprint = Blueprint("volunteer", __name__)


@volunteer_blueprint.route("/add_user_on_event", methods=["POST"])
def add_user_on_event():
    id_user = request.json.get("id_user")
    id_event = request.json.get("id_event")
    response = DataBaseVolunteerList.add_data_register(id_user=id_user, id_event=id_event)
    return jsonify(response)


@volunteer_blueprint.route("/event_list", methods=["GET"])
def volunteer():
    data = Event.refactor_event_for_json()
    return jsonify(data)
