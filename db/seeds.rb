require 'csv'
Target.create!(
  name: "4chan",
  base_url: "http://www.4chan.org",
  sanitize_options: {elements: ["html", "div"] }.to_s,
  default_depth: 2 )
Target.create!(
  name: "8chan",
  base_url: "http://www.8ch.net",
  sanitize_options: {elements: ["html", "div", "span"] }.to_s,
  default_depth: 2 )

# CSV.read(Rails.root + 'lib/assets/LookupCraigsZip2010.csv', {headers: true}).each do |row|
#   CraigslistLookup.create!(zip: row[1], zip_name: row[2], craigslist_subdomain: row[0])
# end

# craigslist_subdomains = CraigslistLookup.all.map(&:craigslist_subdomain).uniq

# craigslist_subdomains.each do |subdomain|
#   Target.create!(
#     name: "craigslist",
#     base_url: subdomain,
#     sanitize_options: { elements: ["html", "div", "p", "span"] }.to_s,
#     default_depth: 3 )
# end
