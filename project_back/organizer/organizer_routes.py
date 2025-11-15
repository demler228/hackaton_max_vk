from flask import jsonify, request, Blueprint
from project_back.data_access_layers.event_dal import DataBaseEvent

organizer_blueprint = Blueprint("organizer", __name__)


@organizer_blueprint.route("/register_event", methods=["POST"])
def reg_event():
    name = request.json.get("name")
    location = request.json.get("location")
    date = request.json.get("date")
    time = request.json.get("time")
    goal_amount = request.json.get("goalAmount")
    description = request.json.get("description")
    organizer_id = request.json.get("organizerId")
    response = DataBaseEvent.register_event(name=name, location=location,
                                            date=date, time=time,
                                            goalAmount=goal_amount, description=description,
                                            organizerId=organizer_id)
    return jsonify(response)


@organizer_blueprint.route("/delete_event", methods=["POST"])
def del_event():
    id_event = request.json.get("id_event")
    response = DataBaseEvent.delete_event(id_event)
    return jsonify(response)
