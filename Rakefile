require 'minitest/test_task'
require './app'

Minitest::TestTask.create(:test) do |t|
  t.libs << "tests"
  t.warning = false
  t.test_globs = ["tests/**/*_spec.rb"]
end

task :default => :test
