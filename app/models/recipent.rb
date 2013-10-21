class Recipent < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
    product = find_by_id(row["id"]) || new
    product.attributes = row.to_hash.slice(*accessible_attributes)
    product.save!
     end
  end
end