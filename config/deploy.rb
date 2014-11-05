require "bundler/capistrano"
set :default_environment, {
  'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH"
}
server "198.199.117.36", :web, :app, :db, primary: true

set :application, "startups"
set :user, "jizilong"
set :deploy_to, "/home/#{user}/#{application}"
# set :keys, "/home/.ssh/id_rsa.pub"
set :deploy_via, :remote_cache
set :use_sudo, false

set :scm, "git"
set :repository, "git@github.com:apprentice1988/youngers.git"
set :branch, "master"

namespace :rails do
  desc "Remote console"
  task :console, :roles => :app do
    run_interactively "bundle exec rails console #{rails_env}"
  end
 
  desc "Remote dbconsole"
  task :dbconsole, :roles => :app do
    run_interactively "bundle exec rails dbconsole #{rails_env}"
  end
end
 
def run_interactively(command, server=nil)
  server ||= find_servers_for_task(current_task).first
  exec %Q(ssh startups -t 'cd ~/startups/current && #{command}')
end



default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  desc "tail production log files" 
  task :tail_logs, :roles => :app do
    trap("INT") { puts 'Interupted'; exit 0; }
    run "tail -f #{shared_path}/log/production.log" do |channel, stream, data|
      puts  # for an extra line break before the host name
      puts "#{channel[:host]}: #{data}" 
      break if stream == :err
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs /home/#{user}/#{application}/current/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs /home/#{user}/#{application}/current/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end