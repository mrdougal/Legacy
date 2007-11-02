set :application, "silvana_site"
set :repository, "http://svn.mrdougal.com.au/#{application}/trunk"
set :shared_server, "chewie.segpub.com.au" # e.g. "luke.segpub.com.au"
set :user, "mrdouga"

# This is an optional change. I recommend you leave as is
set :deploy_to, "/home/#{user}/apps/#{application}"
set :use_sudo, false

role :web, shared_server
role :app, shared_server
role :db,  shared_server, :primary => true


desc  "Fires once the deployment is done"
task :after_deploy do
  symlink_uploaded_images
end

desc  "Set the symlink for the uploaded images"
task  :symlink_uploaded_images do
  run <<-CMD
    ln -nfs #{deploy_to}/shared/uploaded #{deploy_to}/current/public/uploaded
  CMD
end