task :ci do
  "db:drop"
  "db:create"
  "db:migrate"
  "db:seed"
  "db:spec"
end
