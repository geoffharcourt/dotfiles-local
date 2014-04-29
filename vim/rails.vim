let g:rails_projections = {
\ "app/models/*.rb" : {
\   "related": "spec/factories/%p.rb"
\ },
\ "spec/factories/*.rb": {
\   "command": "factory",
\   "affinity": "model",
\   "template": "FactoryGirl.define do\n  factory :%i do\n  end\nend",
\   "related": "app/models/%i.rb",
\   "test": [
\     "spec/models/factory_spec.rb"
\   ]
\ },
\ "app/decorators/*_decorator.rb": {
\   "command": "decorator",
\   "template": "class %SDecorator < Draper::Decorator\nend",
\   "test": [
\     "spec/decorators/%s_decorator_spec.rb"
\   ]
\ },
\ "app/serializers/*_serializer.rb": {
\   "command": "serializer",
\   "template": "class %SSerializer < ActiveModel::Serializer\nend",
\   "test": [
\     "spec/serializers/%s_serializer_spec.rb"
\   ]
\ },
\ "app/workers/*_worker.rb": {
\   "command": "worker",
\   "template": "class %SWorker\n  include Sidekiq::Worker\n\nend",
\   "test": [
\     "spec/workers/%s_worker_spec.rb"
\   ]
\ },
\ "spec/javascripts/*_spec.coffee": {
\   "command": "jspec",
\   "alternate": [
\     "app/assets/javascripts/%s.coffee",
\     "app/assets/javascripts/%s.js",
\     "lib/assets/javascripts/%s.coffee",
\     "lib/assets/javascripts/%s.js"
\   ]
\ },
\ "config/application.rb": {"command": "application"},
\ "Gemfile": {"command": "gemfile"},
\ "config/routes.rb": {"command": "routes"},
\ "config/locales/en.yml": {"command": "locales"},
\ "spec/features/*_spec.rb": {"command": "feature"},
\ "spec/requests/*_spec.rb": {"command": "request"},
\ "spec/support/*.rb": {"command": "support"},
\ ".env": {"command": "secrets"},
\ }
