require 'rubygems'
require 'bundler/setup'
require "active_record"
require "make_private"


Dir.glob(File.expand_path(File.dirname(__FILE__)) + "/support/**/*.rb").each { |file| require file}
db_config = YAML::load(File.open('db.yml'))['test']
db_config["database"] = File.expand_path(File.dirname(__FILE__)) + '/../'+ db_config["database"]
ActiveRecord::Base.establish_connection(db_config)

Dir.glob(File.expand_path(File.dirname(__FILE__)) + "/models/**/*.rb").each { |file| require file}

RSpec.configuration do |config|
end
