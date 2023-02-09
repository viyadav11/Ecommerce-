require 'csv'
namespace :item do
  desc "Imports a CSV file into an ActiveRecord table"

  task create_items: :environment do
    file = "db/csv/item.csv"
    CSV.foreach(file, :headers => true) do |row|
      # Item.create(:name => row[0],:price => row[1],:rating => row[2])
      Item.create(row.to_hash)
    end
  end
end
