set :application, 'lahore_diagnostic_center'
set :repo_url,  'git@github.com:abdulkhaliqdev/lahore_diagnostic_center.git'

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deploy/lahore_diagnostic_center"

# Default value for :linked_files is []
append :linked_files, "config/application.yml", "config/database.yml", "config/master.key"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", '.bundle', 'vendor/bundle', 'storage'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:db) do
      with rails_env: fetch(:rails_env) do
        within release_path do
          # execute :rake, "product:migrate_product_images_to_images_model"
        end
      end
    end
    on roles(:web) do
      execute 'sudo systemctl restart lahore_diagnostic_center.service'
    end
  end
end

after 'deploy:publishing', 'deploy:restart'

set :migration_role, :db
