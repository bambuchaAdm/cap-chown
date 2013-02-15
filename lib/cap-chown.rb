require "cap-chown/version"

Capistrano::Configuration.instance(:must_exist).load do
  namespace :deploy do
    desc "Chown all files in release to application account"
    
    task :chown do
      old_sudo = sudo
      set :sudo, "sudo"
      if defined?(:app_user) && defined?(:app_group)
        run "#{sudo} chown -R #{app_user}:#{app_group} #{releases_path}"
      else
        run "#{sudo} chown -R --reference=#{deploy_to} #{releases_path}"
      end
      set :sudo, old_sudo
    end
  end
  after 'deploy:cleanup', 'deploy:chown'
end
