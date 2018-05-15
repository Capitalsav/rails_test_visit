require 'csv'

class User < ApplicationRecord
  def self.parse_csv_users(csv_file)
    CSV.foreach(csv_file.path, headers: true) do |row|

    end
  end
end
