# module CsvJob

#   @queue = :csv

#   def perform(recipient)
#     report = Repcipient.find(report_id)
#     items = query_ranged_downloads()

#     csv = compile_csv(items)

#     update_report(report.id, csv)
#   end



#   def compile_csv(items)
#     CSV.generate do |csv|

#     end
#   end

#   def update_repicipient(recipient, csv)
#     recipient = Recipient.find(report_id)
#     recipient.update_attributes(csv: StringIO.new(csv), status: true)
#     recipient.save!
#   end 
# end

