Rails.application.config.exceptions_app = Rails.application.routes

Rails.application.config.i18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
Rails.application.config.i18n.default_locale = :es

Rails.application.config.time_zone = "America/Asuncion"