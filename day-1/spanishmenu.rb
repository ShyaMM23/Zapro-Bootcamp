def show_spanish_menu
    puts "=== Sistema de Gestión de Biblioteca ==="
    puts "1. Agregar un libro"
    puts "2. Listar libros"
    puts "3. Buscar un libro"
    puts "4. Actualizar un libro"
    puts "5. Eliminar un libro"
    puts "6. Salir"
    print "Presione Enter para volver al menú principal"
    gets
end
loop do
    puts "=== Libary Management System === "
    puts "0. Show menu in spanish"
    puts "1. Add a book"
    puts "2. List books"
    puts "3. Search for a book"
    puts "4. Update a book"
    puts "5. Delete a book"
    puts "6. Exit"
    print "Enter your choice:"
    ch=gets.chomp.to_i
    case ch
    when 0
        show_spanish_menu
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

=begin
-----------OUTPUT-----------------
=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:0
=== Sistema de Gestión de Biblioteca ===
1. Agregar un libro
2. Listar libros
3. Buscar un libro
4. Actualizar un libro
5. Eliminar un libro
6. Salir
Presione Enter para volver al menú principal

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:1
Add book - coming soon!

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:2
List books - coming soon!

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:3
search book - coming soon!

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:4
update book - coming soon!

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:5
delete book - coming soon!

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
Enter your choice:6
Goodbye!

=end
