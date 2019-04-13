let g:rails_projections = {
\ "app/models/*.rb": {
\   "related": "spec/factories/{plural}.rb",
\ },
\ "app/controllers/*_controller.rb": {
\   "related": "spec/requests/{basename}_spec.rb",
\ },
\ "config/application.rb": {"command": "application"},
\ "Gemfile": {"command": "gemfile"},
\ "config/routes.rb": {"command": "routes"},
\ "spec/factories/*.rb": {
\   "command": "factory",
\   "related": "app/models/{singular}.rb",
\ },
\ "spec/requests/*_spec.rb": {
\   "related": "app/controllers/{basename}_controller.rb",
\ },
\ }
