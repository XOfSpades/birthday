# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

if Rails.env.production?
  task default: [:'db:create', :'db:migrate']
else
  task default: [:rspec, :bundle_audit]
end

Rails.application.load_tasks
