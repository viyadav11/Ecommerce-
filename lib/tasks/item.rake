# frozen_string_literal: true

require 'csv'
namespace :item do
  desc 'Imports a CSV file into an ActiveRecord table'
  task create_items: :environment do
    file = 'db/csv/item.csv'
    CSV.foreach(file, headers: true) do |row|
      # Item.create(:name => row[0],:price => row[1],:rating => row[2])
      if row[0] != 'nil' && row[1] != 'nil' && row[1] != '0' && row[2] != 'nil' && row[2] != '0'
        # Item.create(row.to_hash)
        Item.create(name: row[0], price: row[1], rating: row[2])
      end
    end
  end
end
