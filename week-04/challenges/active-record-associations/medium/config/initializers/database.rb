require 'yaml'
config = YAML.load_file("config/database.yml")

ActiveRecord::Base.establish_connection(
  adapter:  config[APP_ENV]["adapter"],
  database: config[APP_ENV]["database"]
)
