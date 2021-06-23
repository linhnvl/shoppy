set :stage, :production
set :rails_env, :production
set :deploy_to, "~/shoppy"
set :branch, :master1
server "45.32.106.63", user: "deploy", roles: [:web, :app, :db]
