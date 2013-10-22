class Recipent < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def self.import(file)
  CSV.foreach(file.path, headers: true) do |row|
    Product.create! row.to_hash
  end
 end
end