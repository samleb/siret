require "rake"

begin
  require "jeweler"
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "siret"
    gemspec.summary = "Generate and validate French SIRET numbers (enterprises identifier)"
    gemspec.email = "samuel.lebeau@gmail.com"
    gemspec.homepage = "http://github.com/samleb/siret"
    gemspec.author = "Samuel Lebeau"
    gemspec.add_dependency "rspec"
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

begin
  require "spec/rake/spectask"
  Spec::Rake::SpecTask.new
rescue LoadError
  desc "Run specs"
  task :spec do
    abort "RSpec is not available. Install it with: sudo gem install spec"
  end
end

desc "Analyze code coverage with specs"
begin
  require "rcov/rcovtask"
  Rcov::RcovTask.new("coverage") do |test|
    test.libs << "spec"
    test.test_files = FileList["spec/siret_spec.rb"]
    test.verbose = true
  end
rescue LoadError
  task :coverage do
    abort "RCov is not available. Install it with: sudo gem install rcov"
  end
end

task :default => :coverage
