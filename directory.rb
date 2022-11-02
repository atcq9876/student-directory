def input_students
  puts "Please enter the names, heights and cohorts of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Enter name: "
  name = gets.chomp
  puts "Enter height in cm: "
  height = gets.chomp.to_sym
  puts "Enter cohort: "
  cohort = gets.chomp.to_sym
  # while the name is not empty, repeat this code
  i = 0
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, height: height, cohort: cohort}
    if cohort.empty?
      students[i][:cohort] = :November
    end
    puts "Did you misspell the name? Yes/no"
    typo = gets.chomp.downcase
    if typo == "yes"
      puts "Please retype the name: "
      students[i][:name] = gets.chomp.to_sym
    else
      students[i][:name] = students[i][:name].to_sym
    end
    if students.count == 1
      puts "Now we have #{students.count} student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    puts "Enter name: "
    name = gets.chomp
    if !name.empty?
      puts "Enter height in cm: "
      height = gets.chomp.to_sym
      puts "Enter cohort: "
      cohort = gets.chomp.to_sym
    end
    i += 1
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains of Academy"
  puts "-------------"
end

def print(students)
  october = []
  november = []
  december = []
  students.each do |student|
    if student[:cohort] == :October
      october.push(student)
    elsif student[:cohort] == :November
      november.push(student)
    elsif student[:cohort] == :December
      december.push(student)
    end
  end

  if !october.empty?
    puts "October students:"
    october.each do |student|
      puts "#{student[:name]}, #{student[:height]}cm"
    end
  end

  if !november.empty?
    puts "November students:"
    november.each do |student|
      puts "#{student[:name]}, #{student[:height]}cm"
    end
  end

  if !december.empty?
    puts "December students:"
    december.each do |student|
      puts "#{student[:name]}, #{student[:height]}cm"
    end
  end


# no longer needed (while loop for printing all students)
#  i = 0
#  while i < students.size do
#    puts "#{students[i][:name]}, #{students[i][:height]}cm, (#{students[i][:cohort]} cohort)".center(40)
#    i += 1
#  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
if !students.empty?
  print_header
  print(students)
  print_footer(students)
end