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
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
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
  name = gets.chomp
  puts "Enter cohort: "
  cohort = gets.chomp.to_sym
  # while the name is not empty, repeat this code
  i = 0
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: cohort}
    if cohort.empty?
      @students[i][:cohort] = :November
    end
    puts "Did you misspell the name? Yes/no"
    typo = gets.chomp.downcase
    if typo == "yes"
      puts "Please retype the name: "
      @students[i][:name] = gets.chomp.to_sym
    else
      @students[i][:name] = @students[i][:name].to_sym
    end
    if @students.count == 1
      puts "Now we have #{@students.count} student"
    else
      puts "Now we have #{@students.count} students"
    end
    # get another name from the user
    puts "Enter name: "
    name = gets.chomp
    if !name.empty?
      puts "Enter cohort: "
      cohort = gets.chomp.to_sym
    end
    i += 1
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

def print_header
  puts "The students of Villains of Academy"
  puts "-------------"
end

def print_students_list
  october = []
  november = []
  december = []
  @students.each do |student|
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
      puts "#{student[:name]}"
    end
  end

  if !november.empty?
    puts "November students:"
    november.each do |student|
      puts "#{student[:name]}"
    end
  end

  if !december.empty?
    puts "December students:"
    december.each do |student|
      puts "#{student[:name]}"
    end
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu