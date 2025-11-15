__all__ = ("main_volunteer_blueprint",)

from flask import Blueprint

from .volunteer_routes import volunteer_blueprint

main_volunteer_blueprint = Blueprint("main_volunteer_blueprint", __name__)
main_volunteer_blueprint.register_blueprint(volunteer_blueprint)
