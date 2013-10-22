class Recipient < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  belongs_to :campaign
  mount_uploader :recipients, RecipientsUploader

  def self.import(file)
    CSV.foreach(file.path, headers: true,:skip_blanks => true) do |row|
    Recipent.create! row.to_hash
  end
 end


 
# The phrase on the left side of the @@ is being converted to a tsvector 
# while the phrase on the right is converted to a plain tsquery. 

 def self.text_search(query)
  if query.present?
     search(query)
 else
    scoped
  end
 end

end