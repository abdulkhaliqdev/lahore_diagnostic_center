require 'stackprof'

# Profile webpack-dev-server
pid = fork do
  exec './bin/webpack-dev-server'
end

# Wait for webpack-dev-server to start
sleep 5

# Profile rails server
StackProf.run(mode: :cpu, out: 'tmp/webpack-dev-server_profile.dump') do
  `rails s`
end

Process.kill('SIGINT', pid)
