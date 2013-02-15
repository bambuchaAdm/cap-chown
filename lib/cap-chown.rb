require "cap-chown/version"

Capistrano::Configuration.instance(:must_exist).load do
  namespace :deploy do
    desc "Chown all files in release to application account"
    
    task :chown do
      old_sudo = sudo
      set :sudo, "sudo"
      if exists?(:app_user) && exists?(:app_group)
        run "#{sudo} chown -R #{app_user}:#{app_group} #{deploy_to}"
      else
        run "#{sudo} chown -R --reference=#{deploy_to} #{deploy_to}"
      end
      set :sudo, old_sudo
    end
  end
  after 'deploy:cleanup', 'deploy:chown'
end
