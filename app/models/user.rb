require 'csv'

# Class of model user.
# DB representation: Name, Date, Number, Description
class User < ApplicationRecord
  VALID_HEADERS = %w[name date number description].freeze

  def self.parse_csv_users(csv_file)
    data = CSV.read(csv_file.path, headers: true)
    return false unless data.headers == VALID_HEADERS
    CSV.foreach(csv_file.path, headers: true) do |row|
      User.create row.to_h
    end
    true
  end
end
