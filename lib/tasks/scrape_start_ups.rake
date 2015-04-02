namespace :db do 
  task import_start_up_from_coffee: :environment do
    Crawlers::StartUps::GuangguCoffee.scrape_list
  end

  task import_start_up_details_from_coffee: :environment do
    Crawlers::StartUps::GuangguCoffee.scrape_details
  end
end