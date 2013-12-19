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

 def self.import_csv
  respond_to do |format|
    @csv_text = File.read(params[:file].tempfile.to_path.to_s)
    @csv = CSV.parse(@csv_text, :headers => false)
    @n=0

    @csv.each do | row |
      @recipient = Recipient.new
      @recipient.first_name = row[0]
      @recipient.last_name = row[1]
      @recipient.email = row[2]
      @recipient.phone = row[3]
      @recipient.save

      @n=@n+1
      GC.start if @n%50==0
      flash[:notice] = "CSV Imported Successfully, with  #{@n} records"                                
    end
  end
 end
end