require "faker"
require "active_record_migrations"
require_relative "./config/app"

ActiveRecordMigrations.configure do |c|
  c.yaml_config = 'config/database.yml'
  c.environment = APP_ENV
end
ActiveRecordMigrations.load_tasks

desc "IRB Console"
task :console do
  system("irb -r ./config/app.rb")
end

namespace :db do
  desc "Database console"
  task :console do
    system("psql #{ActiveRecord::Base.connection.current_database}")
  end

  desc "Create fixtures based on current database"
  task :generate_fixtures do
    Dir.glob("app/models/*rb").each do |model_file|
      model = File.basename(model_file, File.extname(model_file)).titleize.constantize

      fixture_file = "fixtures/#{model.table_name}.yml"
      File.open(fixture_file, "w") do |f|
        model.all.each do |record|
          f.puts({ "#{model.table_name.singularize}_#{record.id}" => record.attributes }.to_yaml.sub!(/---\s?/, "\n"))
        end
      end
    end
  end
end
