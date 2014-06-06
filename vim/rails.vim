let g:rails_projections = {
\ "app/models/*.rb": {
\   "related": "spec/factories/%p.rb",
\ },
\ "spec/factories/*.rb": {
\   "command": "factory",
\   "affinity": "collection",
\   "alternate": "app/models/%i.rb",
\   "related": "db/schema.rb#%s",
\   "test": "test/models/%i_test.rb",
\   "template": "FactoryGirl.define do\n  factory :%i do\n  end\nend",
\   "keywords": "factory sequence"
\ },
\ "app/decorators/*_decorator.rb": {
\   "affinity": "model",
\   "command": "decorator",
\   "template": "class %SDecorator < Draper::Decorator\nend",
\   "test": [
\     "spec/decorators/%s_decorator_spec.rb"
\   ]
\ },
\ "app/serializers/*_serializer.rb": {
\   "command": "serializer",
\   "template": "class %SSerializer\nend",
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
\ "spec/requests/*.rb": {
\   "command": "request",
\   "alternate": "app/controllers/%s_controller.rb"
\ },
\ "config/application.rb": {"command": "application"},
\ "Gemfile": {"command": "gemfile"},
\ "config/routes.rb": {"command": "routes"},
\ "config/locales/en.yml": {"command": "locales"},
\ "spec/features/*_spec.rb": {"command": "feature"},
\ "spec/support/*.rb": {"command": "support"},
\ ".env": {"command": "secrets"},
\ }
