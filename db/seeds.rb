require 'csv'


CSV.read(Rails.root + 'lib/assets/LookupCraigsZip2010.csv', {headers: true}).each do |row|
  CraigslistLookup.create!(zip: row[1], zip_name: row[2], craigslist_subdomain: row[0])
end