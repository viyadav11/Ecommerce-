# frozen_string_literal: true

require 'csv'
class Item < ApplicationRecord
  has_and_belongs_to_many :orders
  validates :name, :price, presence: { message: 'Please provide the value' }
  validates :rating, numericality: { less_than: 10, message: 'Rating should be in between 1-10' }

  def self.to_csv
    items = all
    CSV.generate do |csv|
      csv << column_names
      items.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end
end
