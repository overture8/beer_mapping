require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "beer_mapping"
    gem.summary = %Q{Ruby wrapper for beermapping.com}
    gem.description = %Q{Allows you to find where pubs are, how they are rating etc.}
    gem.email = "phil.mcclure@gmail.com"
    gem.homepage = "http://github.com/overture8/beer_mapping"
    gem.authors = ["Phil McClure"]
    gem.files = Dir["lib/**/*"] + ["LICENSE", "README.rdoc", "Rakefile", "CHANGELOG.rdoc"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end
