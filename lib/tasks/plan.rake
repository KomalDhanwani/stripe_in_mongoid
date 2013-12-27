namespace :db do
  task :create_default_plans => :environment do
    Plan.find_or_create_by({name: "Basic", price: 10})
    Plan.find_or_create_by({name: "Silver", price: 25})
    Plan.find_or_create_by({name: "Gold", price: 100})
  end
end