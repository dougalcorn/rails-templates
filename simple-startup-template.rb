file '.gitignore', %q{
log/*.log
tmp/**/*
doc/api
doc/app
}

run "touch log/.gitignore"
run "touch tmp/.gitignore"

rake "rails:freeze:gems" unless defined?(RAILS_ROOT) and File.exists?(File.join(RAILS_ROOT, "vendor", "rails"))

rakefile "tags.rake" do
  <<-TASK
module Tags
  RUBY_FILES = FileList['**/*.rb'].exclude("pkg")
end

namespace "tags" do
  desc "build the TAGS file using exuberant ctags for emacs"
  task :emacs do
    puts "Making Emacs TAGS file"
    `xctags -e \#\{Tags::RUBY_FILES}`
  end
end

task :tags => ["tags:emacs"]
  TASK
end

git :init
git :add => "."
