require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...

# Testing employee validation - these stores should not be created
@store2.employees.create(first_name: "Mark", last_name: "Wahlberg", hourly_rate: 24)
@store2.employees.create(first_name: "Arsalan", last_name: "Menhaj", hourly_rate: 250)
@store2.employees.create(first_name: "", last_name: "Wahlberg", hourly_rate: 45)
Employee.all.each do |employee|
  puts employee.first_name
end

# Testing store validation - these employees should not be created
Store.create(name: 'Bo', annual_revenue: 300000, mens_apparel: true, womens_apparel: true)
Store.create(name: 'Cabbagetown', annual_revenue: 400000, mens_apparel: false, womens_apparel: false)
Store.all.each do |store|
  puts store.name
end

new_store_name = gets.chomp
@new_store = Store.create(name: new_store_name)
if @new_store.errors.any?
  @new_store.errors.full_messages.each do |error_message|
    puts error_message
  end
end

