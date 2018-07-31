let g:rails_projections = {
\ "app/models/*.rb": {
\   "related": "spec/factories/{plural}.rb",
\ },
\ "config/application.rb": {"command": "application"},
\ "Gemfile": {"command": "gemfile"},
\ "config/routes.rb": {"command": "routes"},
\ "spec/factories/*.rb": {
\   "command": "factory",
\   "related": "app/models/{singular}.rb",
\ },
\ }
