class Recipient < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :campaigns
  belongs_to :user

  mount_uploader :recipients, RecipientsUploader

  def self.import(file)
    CSV.foreach(file.path, headers: true,:skip_blanks => true) do |row|
    Recipent.create! row.to_hash
  end
 end

 def self.text_search(query)
  if query.present?
     search(query)
 else
    scoped
  end
 end

end