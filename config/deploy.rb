# config valid only for current version of Capistrano
lock '3.5.0'


set :application, 'proteuspartners'
set :repo_url, 'git@github.com:unepwcmc/proteuspartners.git'
set :branch, 'master'

set :deploy_user, 'wcmc'
set :deploy_to, "/home/#{fetch(:deploy_user)}/#{fetch(:application)}"

set :scm, :git
set :scm_username, "unepwcmc-read"

set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.0.0-p481'


set :pty, true


set :ssh_options, {
  forward_agent: true,
}


set :linked_files, %w{config/database.yml config/initializers/refinery/core.rb config/initializers/secret_token.rb}

set :linked_dirs, fetch(:linked_dirs, []).push('bin', 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle')

set :keep_releases, 5

