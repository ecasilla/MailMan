require 'csv'
class Recipient < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name,:last_name, presence: true
  has_many :campaigns
  belongs_to :user
  has_attached_file :csv

  #after_csv_post_process

 def self.text_search(query)
  if query.present?
     search(query)
 else
    scoped
  end
 end

 def self.import_csv(file,user)
    CSV.foreach(file.path, headers: true) do |row|
      user.recipients.create! row.to_hash
    end
 end
end


