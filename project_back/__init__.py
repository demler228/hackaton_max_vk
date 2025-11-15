__all__ = ("main_blueprint",)

from flask import Blueprint

from .organizer import main_organizer_blueprint
from .volunteer import main_volunteer_blueprint

main_blueprint = Blueprint("main", __name__)
main_blueprint.register_blueprint(main_volunteer_blueprint)
main_blueprint.register_blueprint(main_organizer_blueprint)
