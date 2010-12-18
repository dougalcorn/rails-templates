gem 'shoulda', :lib => 'shoulda/rails', :env => "test"
gem 'factory_girl', :env => "test"
gem 'flexmock', :lib => 'flexmock/test_unit',  :env => "test"
gem 'webrat', :env => "test"
gem 'holygrail', :env => "test"

append_file(".gitignore", "webrat*html")

config_webrat = <<WEBRAT
Webrat.configure {|config| config.mode = :rails; config.open_error_files = false }
WEBRAT
append_file("test/test_helper.rb", config_webrat)

rake "gems:unpack", :env => "test"

git :add => "config/environments/test.rb"
git :add => "vendor/gems"
git :add => ".gitignore"
git :add => "test/test_helper.rb"
git :commit => "-m 'Adding shoulda, factory_girl, flexmock, and webrat'" if yes?("Commit change?")
