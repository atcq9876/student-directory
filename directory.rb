# Let's put all students into an array
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked With of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
]
# And then print them
puts "The students of Villains of Academy"
puts "-------------"
students.each do |student|
  puts student
end
# Finally, we print the total number of students
puts "Overall, we have #{students.count} great students"