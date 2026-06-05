#print methods
puts "Hello world"
print "Hello"
p "Hello"
name = "Deepak"
age=20
print name
printf("\nName: %s", name)
puts "\nName: #{name}"
puts "Name: %s" % name
puts "Name: %s Age: %d" % [name, age]
puts "Name:", name, age
puts "Name: #{name}, Age: #{age}"
printf("Name: %s, Age: %d", name, age)

#gets methods
n=gets
puts n
f=20.to_f
puts f
print "Enter your name: "
name = gets.chomp
print "Enter your age: "
age = gets.chomp.to_i
puts "Welcome #{name}"
puts "You are #{age} years old"

#conditional statements
if age>=18
    puts "You are eligible to vote"
else
    puts "You are not eligible to vote"
end
day = "Monday"

mark = 85

if mark >= 90
  puts "Grade A+"
elsif mark >= 80
  puts "Grade A"
elsif mark >= 70
  puts "Grade B"
else
  puts "Grade C"
end

case day
when "Monday"
  puts "Start of Week"
when "Friday"
  puts "Weekend Coming"
when "Sunday"
  puts "Holiday"
else
  puts "Normal Day"
end

#loops
i = 1
while i <= 5
  puts i
  i += 1
end

i = 1
loop do
  puts i
  i += 1
  break if i > 5
end

#for
for i in 1..5
  puts i
end

#times
5.times do
  puts "Hello"
end
5.times do |i|
  puts i
end

#each
numbers = [10, 20, 30]
numbers.each do |num|
  puts num
end

names = ["Shyam", "Deepak", "Vessley"]
names.each_with_index do |name, index|
  puts "#{index}: #{name}"
end

