# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "shoppy"
set :repo_url, "git@github.com:linhnvl/shoppy.git"
# server "45.32.106.63", user: "deploy", roles: [:web, :app, :db], primary: true
# set :user, "root"
# set :branch, :master
# set :stage, :production
# set :rails_env, :production
# set :deploy_to, "~/shoppy"
# set :keep_releases, 5
# set :linked_files, %w{.env}
# set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/upload node_modules}
# append :linked_files, "config/master.key"
# append :linked_files, "config/database.yml"
# append :rbenv_map_bins, 'puma', 'pumactl'
# set :rbenv_ruby, "2.6.3"

set :pty, true
set :linked_files, %w(config/database.yml config/master.key)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads)
set :keep_releases, 5
set :rbenv_path, '/usr/local/rbenv'
set :puma_rackup, -> { File.join(current_path, "config.ru") }
set :puma_state, -> { "#{shared_path}/tmp/pids/puma.state" }
set :puma_pid, -> { "#{shared_path}/tmp/pids/puma.pid" }
set :puma_bind, -> { "unix://#{shared_path}/tmp/sockets/puma.sock" }
set :puma_conf, -> { "#{shared_path}/puma.rb" }
set :puma_access_log, -> { "#{shared_path}/log/puma_access.log" }
set :puma_error_log, -> { "#{shared_path}/log/puma_error.log" }
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, "production"))
set :puma_threads, [0, 8]
set :puma_workers, 0
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false
