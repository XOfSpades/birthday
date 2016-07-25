desc 'Run bundle-audit to check for patch level insecurities'
task :bundle_audit do
  print "\nRunning "
  sh 'bundle-audit update'
  print "\nRunning "
  sh 'bundle-audit' do |ok, _|
    abort unless ok
  end
end

