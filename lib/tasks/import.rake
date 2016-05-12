require 'csv'

desc "Import copywriting from csv file"
task :import => [:environment] do

  csv_text = File.read('copy.csv')
  csv = CSV.parse(csv_text, :headers => true)

  CSV.foreach('copy.csv', headers: true) do |row|
    Refinery::Copywriting::Phrase.create!( 
      :name => row[1], 
      :default => row[2], 
      :value => row[3] 
    ) 
  end

end