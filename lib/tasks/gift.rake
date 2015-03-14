require 'csv'

namespace :gift do
  task init: :environment do
    seed_path = Rails.root.join('data', 'gift.csv')
    CSV.foreach(seed_path, headers: true) do |row|
      Gift.transaction do
        Gift.create!({
          name: row["name"],
          link: row["url"],
          image: row["image"],
          gender: row["gender"],
          min_age: row["min"],
          max_age: row["max"],
          price: row["price"]
        })
      end
    end
  end
end
