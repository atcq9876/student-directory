require 'csv'

@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    # 1. print the menu and ask the user what to do
    print_interactive_menu
    # 2. take input and carry out selected option
    process(STDIN.gets.chomp)
  end
end

def print_interactive_menu
  puts "Please type a number from 1 to 9 to select an option from the choices below:"
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list of students to a file"
  puts "4. Load a list of students from a file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
      puts "Successfully entered new student(s)"
    when "2"
      print_students
      puts "Successfully printed student list"
    when "3"
      save_students_to_file
      puts "Successfully saved students to file"
    when "4"
      load_students_from_file
      puts "Successfully loaded students from file"
    when "9"
      puts "The program will now close"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
  end
end

def add_student_to_array(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the name and cohort of each student. To finish, just hit return twice"
  puts "Enter name: "
  name = STDIN.gets.chomp
  puts "Enter cohort: "
  cohort = STDIN.gets.chomp
  while !name.empty? do
    add_student_to_array(name, cohort)
    @students.count == 1 ? (puts "Now we have 1 student") : (puts "Now we have #{@students.count} students")
    puts "Enter name: "
    name = STDIN.gets.chomp
    if !name.empty?
      puts "Enter cohort: "
      cohort = STDIN.gets.chomp
    end
  end
end

def print_students
  if !@students.empty?
    print_students_header
    print_students_list
    print_students_footer
  else
    puts "There are currently 0 students"
  end
end

def save_students_to_file
  # open the file for writing
  puts "Which file would you like to save to?"
  # iterate over the array of students
  open(gets.chomp, "a") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
  end
end

def load_students_from_file
  puts "Which file would you like to load students from?"
  CSV.foreach(gets.chomp) do |line| 
    name, cohort = line
    add_student_to_array(name, cohort)
  end
end

def load_students_on_startup
  filename = "students.csv"
  load_students_from_file(filename)
  puts "Loaded #{@students.count} students from #{filename}"
end

def print_students_header
  puts "The students of Villains of Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_students_footer
  puts "Overall, we have #{@students.count} great students"
end

# (call temporarily disabled) load_students_on_startup
interactive_menu
