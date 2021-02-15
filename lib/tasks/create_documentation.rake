namespace :create_documentation do
  YARD::Rake::YardocTask.new do |t|
    t.files   = ['lib/**/*.rb', 'app/services/**/*.rb']   # optional
  end
end
