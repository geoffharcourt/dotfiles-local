let g:rails_projections = {
\ "app/models/*.rb": {
\   "related": "spec/factories/{plural}.rb",
\ },
\ "spec/factories/*.rb": {
\   "command": "factory",
\   "affinity": "collection",
\   "alternate": "app/models/{singular}.rb",
\   "related": "db/schema.rb#{}",
\   "test": "test/models/{singular}_test.rb",
\   "template": "FactoryGirl.define do\n  factory :{singular} do\n  end\nend",
\   "keywords": "factory sequence"
\ },
\ "app/decorators/*_decorator.rb": {
\   "affinity": "model",
\   "command": "decorator",
\   "template": "class {camelcase|capitalize|colons}Decorator < Draper::Decorator\nend",
\   "test": [
\     "spec/decorators/{}_decorator_spec.rb"
\   ]
\ },
\ "app/serializers/*.rb": {
\   "command": "serializer",
\   "template": "class {camelcase|capitalize|colons}\nend",
\   "test": [
\     "spec/serializers/{}_spec.rb"
\   ]
\ },
\ "app/workers/*_worker.rb": {
\   "command": "worker",
\   "template": "class {camelcase|capitalize|colons}Worker\n  include Sidekiq::Worker\n\nend",
\   "test": [
\     "spec/workers/{}_worker_spec.rb"
\   ]
\ },
\ "spec/javascripts/*_spec.coffee": {
\   "command": "jspec",
\   "alternate": [
\     "app/assets/javascripts/{}.coffee",
\     "app/assets/javascripts/{}.js",
\     "lib/assets/javascripts/{}.coffee",
\     "lib/assets/javascripts/{}.js"
\   ]
\ },
\ "spec/requests/*.rb": {
\   "command": "request",
\   "alternate": "app/controllers/{}_controller.rb"
\ },
\ "config/application.rb": {"command": "application"},
\ "Gemfile": {"command": "gemfile"},
\ "config/routes.rb": {"command": "routes"},
\ "config/locales/en.yml": {"command": "locales"},
\ "lib/clock.rb": {"command": "clock"},
\ "spec/features/*_spec.rb": {"command": "feature"},
\ "spec/support/*.rb": {"command": "support"},
\ ".env": {"command": "secrets"},
\ }
