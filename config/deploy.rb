lock "~> 3.12.1"

set :application, "lynne-campbell-artist"
set :repo_url, "git@github.com:charlescampbell/lynne-campbell-artist.git"
set :deploy_to, "/home/deploy/#{fetch :application}"

append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', '.bundle', 'public/system', 'public/uploads'

set :keep_releases, 3
