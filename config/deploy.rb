set :application, 'lahore_diagnostic_center'
set :repo_url,  'git@github.com:abdulkhaliqdev/lahore_diagnostic_center.git'

set :rvm_type, :user
set :puma_threads,            [4, 16]
set :puma_workers,            0
set :pty,                     true
set :use_sudo,                false
set :puma_bind,               "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,              "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,                "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log,         "#{release_path}/log/puma.access.log"
set :puma_error_log,          "#{release_path}/log/puma.error.log"
set :puma_preload_app,        true
set :puma_worker_timeout,     nil
set :puma_init_active_record, true
set :keep_releases,           1
set :aws_region, "sgp1"
set :webpack, '/usr/local/bin/webpack'

# Set Node.js version
set :default_env, {
  'NODE_VERSION' => '14.21.2'
}

append :linked_files, 'config/credentials.yml.enc', 'config/database.yml', 'config/master.key'
append :linked_dirs, 'log', 'storage', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system', '.bundle', 'vendor/bundle'

namespace :deploy do
  namespace :check do
    desc 'check: copy config/master.key, config/credentials.yml.en and config/database.yml to shared/config'
    before :linked_files, :set_configs do
      on roles(:web), in: :sequence, wait: 10 do
        upload! 'config/database.yml', "#{shared_path}/config/database.yml" unless test("[ -f #{shared_path}/config/database.yml ]")
        upload! 'config/master.key', "#{shared_path}/config/master.key" unless test("[ -f #{shared_path}/config/master.key ]")
        unless test("[ -f #{shared_path}/config/credentials.yml.enc ]")
          upload! 'config/credentials.yml.enc', "#{shared_path}/config/credentials.yml.enc"
        end
      end
    end
  end

  before "deploy:assets:precompile", "deploy:yarn_install"

  namespace :deploy do
    desc "Run rake yarn install"
    task :yarn_install do
      on roles(:web) do
        within release_path do
          with node_env: fetch(:node_env, 'production'), path: fetch(:yarn_path, '$HOME/.yarn/bin') do
            execute("cd #{release_path} && yarn install --silent --no-progress --no-audit --no-optional")
          end
        end
      end
    end
  end

  # Profile webpack-dev-server
  # task :profile_webpack_dev_server do
  #   on roles(:web) do
  #     within release_path do
  #       execute :bundle, 'exec ./bin/webpack-dev-server'
  #     end
  #   end
  # end

  # # Profile rails server
  # task :profile_rails_server do
  #   on roles(:web) do
  #     within release_path do
  #       execute :bundle, 'exec rails s'
  #     end
  #   end
  # end

  # # Combine the profiling tasks
  # task :profile_servers do
  #   invoke 'profile_webpack_dev_server'
  #   invoke 'profile_rails_server'
  # end
end
