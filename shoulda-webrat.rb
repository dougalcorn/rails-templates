gem 'thoughtbot-shoulda', :lib => 'shoulda/rails', :source => 'http://gems.github.com', :env => "test"
gem 'thoughtbot-factory_girl', :lib => 'factory_girl', :source => "http://gems.github.com", :env => "test"
gem 'flexmock',  :env => "test"
gem 'brynary-webrat', :lib => 'webrat', :source => "http://gems.github.com", :env => "test"

append_file(".gitignore", "webrat*html")

config_webrat = <<WEBRAT
Webrat.configure {|config| config.mode = :rails; config.open_error_files = false }
WEBRAT
append_file("test/test_helper.rb", config_webrat)

rake "gems:unpack", :env => "test"

git :add => "config/environments/test.rb"
git :add => "vendor/gems"
git :commit => "-m 'Adding shoulda, factory_girl, flexmock, and webrat'" if yes?("Commit change?")
