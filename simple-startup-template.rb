file '.gitignore', %q{
log/*.log
tmp/**/*
doc/api
doc/app
}

run "touch log/.gitignore"
run "touch tmp/.gitignore"

rake "rails:freeze:gems"

git :init
git :add => "."
git :commit => "-a -m 'Initial commit'"