# ./lib/event_manager.rb
require "csv"

def clean_zipcode(zipcode)
    # if zipcode.nil?
    #     "00000"
    # elsif zipcode.length < 5
    #     zipcode.rjust(5, "0")
    # elsif zipcode.length > 5
    #     zipcode[0..4]
    # else 
    #     zipcode
    # end
    zipcode.to_s.rjust(5, "0")[0..4]
end

puts "EventManager initialized."

# contents = File.read "./data/event_attendees.csv"

# lines = File.readlines "./data/event_attendees.csv"
# lines.each_with_index do |line, index|
#     next if index == 0
#     columns = line.split(",")
#     name = columns[2]
#     puts name
# end

contents = CSV.open "./data/event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    puts "#{name} #{zipcode}"
end