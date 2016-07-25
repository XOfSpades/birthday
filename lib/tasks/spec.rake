desc 'Run rpsec'
task :rspec do
  print "\nRunning "
  sh 'bundle exec rspec' do |ok, _|
    abort unless ok
  end
end
