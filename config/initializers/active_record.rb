connection_details = YAML::load(ERB.new(File.read('config/database.yml')).result)
ActiveRecord::Base.establish_connection(connection_details[ENV['RACK_ENV']])