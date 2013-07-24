desc "Run Specs"
task :run_spec => :environment do
  system('bundle exec rspec spec')
end

task :ci => [:'db:drop',:'db:create',:'db:migrate',:'db:seed', :'run_spec']
