#!/usr/bin/env puma

directory '{{ rails_app_path }}/current'
rackup "{{ rails_app_path }}/current/config.ru"
environment '{{ rails_app_path }}'

state_path "{{ rails_app_path }}/shared/tmp/pids/puma.state"
stdout_redirect '{{ rails_app_path }}/shared/log/puma_access.log', '{{ rails_app_path }}/shared/log/puma_error.log', true

bind 'tcp://localhost:{{ rails_puma_port }}'

threads {{ rails_puma_threads }}
workers {{ rails_puma_workers }}
worker_timeout 100
prune_bundler

before_fork do
  require 'puma_worker_killer'
  PumaWorkerKiller.config do |config|
    config.ram           = {{ rails_puma_ram }}
    config.frequency     = {{ rails_puma_frequency }}
    config.percent_usage = 0.9
    config.rolling_restart_frequency = {{ rails_puma_rolling_restart_frequency }}
  end
  PumaWorkerKiller.start
end
