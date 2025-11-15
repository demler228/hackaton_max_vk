__all__ = ("main_organizer_blueprint",)

from flask import Blueprint

from .organizer_routes import organizer_blueprint

main_organizer_blueprint = Blueprint("main_organizer_blueprint", __name__)
main_organizer_blueprint.register_blueprint(organizer_blueprint)
