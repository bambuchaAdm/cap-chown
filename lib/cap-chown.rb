require "cap-chown/version"

Capistrano::Configuration.instance(:must_exist).load do
  namespace :deploy do
    desc "Chown all files in release to application account"
    
    task :chown do
      if app_user && app_group
        run "#{sudo} chown -R #{app_user}:#{app_group} #{releases_path}"
      else
        puts "WARNING: not chowning release path, because either app_user or app_group is not set!"
      end
    end
  end
  after 'deploy:cleanup', 'deploy:chown'
end
