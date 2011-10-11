require "bundler/gem_tasks"
require 'rspec/core/rake_task'

require 'active_record'
require 'yaml'
require 'logger'

ROOT = "#{File.dirname(__FILE__)}" unless defined?(ROOT)

namespace :db do
  desc "Migrate the database"
  task(:migrate) do
    db_config = YAML::load(File.open('db.yml'))['test']
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    migration_folder = ROOT << "/spec/migrations/"
    puts migration_folder
    migrations_directory = (migration_folder)
    ActiveRecord::Migrator.migrate(migrations_directory)
  end
end

RSpec::Core::RakeTask.new('spec')
task :default => :spec
