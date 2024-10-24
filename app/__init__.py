from flask import Flask
from app.config import Config

def create_app():
  app = Flask(__name__)
  app.config.from_object(Config)

  from app.routes.home import home_bp

  app.register_blueprint(home_bp)
  return app