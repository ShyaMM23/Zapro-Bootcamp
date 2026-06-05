loop do
    puts "=== Library  Management System ==="
    puts "1. Add a book"
    puts "2. List books"
    puts "3. Search for a book"
    puts "4. Update a book"
    puts "5. Delete a book"
    puts "6. Exit"
    print "Enter your choice:"
    ch=gets.chomp.to_i
    case ch
    when 1 
        puts "Add book - coming soon!"
    when 2
        puts "List books - coming soon!"
    when 3
        puts "search book - coming soon!"
    when 4
        puts "update book - coming soon!"
    when 5
        puts "delete book - coming soon!"
    when 6 
        puts "Goodbye!"
        break
    else
        puts "Invalid choice try again!"
    end
    puts "\n"
end

#while loop implementation
=begin
ch=""
while  ch!="6"
    puts "=== Library  Management System ==="
    puts "1. Add a book"
    puts "2. List books"
    puts "3. Search for a book"
    puts "4. Update a book"
    puts "5. Delete a book"
    puts "6. Exit"
    print "Enter your choice:"
    ch=gets.chomp
    case ch
    when "1" 
        puts "Add book - coming soon!"
    when "2"
        puts "List books - coming soon!"
    when "3"
        puts "search book - coming soon!"
    when "4"
        puts "update book - coming soon!"
    when "5"
        puts "delete book - coming soon!"
    when "6" 
        puts "Goodbye!"
    else
        puts "Invalid choice try again!"
    end
end
=end

=begin
--------------OUTPUT----------------
=== Library  Management System ===
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:1
Add book - coming soon!

=== Library  Management System ===
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:2
List books - coming soon!

=== Library  Management System ===
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:3
search book - coming soon!

=== Library  Management System ===
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:4
update book - coming soon!

=== Library  Management System ===
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:5
delete book - coming soon!

=== Library  Management System ===
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:6
Goodbye!
=end

