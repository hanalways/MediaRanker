# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

WORK_FILE = Rails.root.join('db', 'media_seeds.csv')
puts "Loading raw work data from #{WORK_FILE}"

work_failures = []
CSV.foreach(WORK_FILE, :headers => true) do |row|
  next if Work.where(id: row['id']).present?

  work = Work.new
  work.id = row['id']
  work.category = row['category']
  work.title = row['title']
  work.creator = row['creator']
  work.publication_year = row['publication_year']
  work.description = row['description']
  successful = work.save 
  if !successful
    work_failures << work
    puts "Failed to save work: #{work.inspect}"
  else 
    puts "Created driver: #{work.inspect}"
  end
end

puts "Added #{Work.count} work records"
puts "#{work_failures.length} drivers failed to save"

puts "Manually resetting PK sequence on each table"
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

puts "done"