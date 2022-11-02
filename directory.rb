@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_menu
    # 2. take input and carry out selected option
    process(gets.chomp)
  end
end

def print_menu
  puts "Please type a number from 1 to 9 to select an option from the choices below:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names, heights and cohorts of the students"
  puts "To finish, just hit return twice"
  # get the first name
  puts "Enter name: "
  name = gets.chomp.to_sym
  puts "Enter cohort: "
  cohort = gets.chomp.to_sym
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort}
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "Enter name: "
    name = gets.chomp.to_sym
    if !name.empty?
      puts "Enter cohort: "
      cohort = gets.chomp.to_sym
    end
  end
end

def show_students
  if !@students.empty?
    print_header
    print_students_list
    print_footer
  else
    puts "There are currently 0 students"
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def print_header
  puts "The students of Villains of Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu