books=[]
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
    puts "7. List all books"
    puts "8. Browse by genre"
    print "Enter your choice:"
    ch=gets.chomp.to_i
    case ch
    when 0
        show_spanish_menu
    when 1
        print "Enter Book Title:"
        name=gets.chomp
        print "enter author name:"
        author=gets.chomp
        print "Enter year of publication:"
        year=gets.chomp.to_i
        print "Enter the Genre of the book:"
        gen=gets.chomp
        if(gen=="")
            gen="Uncategorized"
        end
        books.push({name:name,author:author,year:year,genre:gen})
    when 2
        books.first(3).each{ |b|
            puts "Name :" + b[:name] + ", Author :" + b[:author] + ", Year of publication :" + b[:year].to_s + ", Genre :" + b[:genre]
        }
    when 3
        print "Enter book Title to search:"
        title=gets.chomp
        f=false
        books.each{ |b|
            if b[:name]== title
                puts "Name :" + b[:name] + ", Author :" + b[:author] + ", Year of publication :" + b[:year].to_s + ", Genre :" + b[:genre]
                f=true
            end      
        }
        if !f
            puts "Book not found!"
        end
    when 4
        print "Enter title to update:"
        title=gets.chomp
        f=false
        books.each{ |b|
            if b[:name] == title
                print "Enter new title:"
                title1=gets.chomp
                print "Enter new author:"
                author1=gets.chomp
                print "Enter new year of publication:"
                year1=gets.chomp.to_i
                print "Enter new genre:"
                genre1=gets.chomp
                b[:name] = title1
                b[:author] = author1
                b[:year] = year1
                b[:genre] = genre1
                puts "Book updated successfully!"
                f=true
            end
            
        }
        if(!f)
            puts "Book not found!"
        end
    when 5
        print "enter title to delete:"
        titl=gets.chomp
        len=books.length
        books.reject!{ |b|
            b[:name]==titl
        }
        if len == books.length
            puts "Book not found!"
        else
            puts "Book deleted successfully!"
        end
    when 6
        puts "Goodbye!"
        break
    when 7
        books.each{ |b|
            puts "Name :" + b[:name] + ", Author :" + b[:author] + ", Year of publication :" + b[:year].to_s + ", Genre :" + b[:genre]
        }
    when 8
        print "enter the genre:"
        genn=gets.chomp.downcase
        f=false
        books.each{ |b|
            if b[:genre].downcase == genn
                puts "Name :" + b[:name] + ", Author :" + b[:author] + ", Year of publication :" + b[:year].to_s + ", Genre :" + b[:genre]
                f=true
            end
        }
        if !f
            puts "No books found in that genre."
        end
    else
        puts "Invalid choice try again!"
    end
    puts "\n"
end

=begin
-----------OUTPUT--------------------
=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
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
7. List all books
8. Browse by genre
Enter your choice:1
Enter Book Title:Atomic habits
enter author name:James Clear
Enter year of publication:2018
Enter the Genre of the book:personal Development

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:1
Enter Book Title:the alchemist
enter author name:paulo coelho 
Enter year of publication:1988
Enter the Genre of the book:adventure

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:1
Enter Book Title:educated
enter author name:tara westover
Enter year of publication:2018
Enter the Genre of the book:biography

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:1   
Enter Book Title:pride and prejudice  
enter author name:jane austen
Enter year of publication:1813
Enter the Genre of the book:classic

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:2
Name :Atomic habits, Author :James Clear, Year of publication :2018, Genre :personal Development
Name :the alchemist, Author :paulo coelho, Year of publication :1988, Genre :adventure
Name :educated, Author :tara westover, Year of publication :2018, Genre :biography


=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:3
Enter book Title to search:Atomic habits
Name :Atomic habits, Author :James Clear, Year of publication :2018, Genre :personal Development

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:4
Enter title to update:pride and prejudice
Enter new title:pride and prejudice
Enter new author:jane austen
Enter new year of publication:2018
Enter new genre:classic
Book updated successfully!

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:5
enter title to delete:pride and prejudice
Book deleted successfully!

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:7
Name :Atomic habits, Author :James Clear, Year of publication :2018, Genre :personal Development
Name :the alchemist, Author :paulo coelho, Year of publication :1988, Genre :adventure
Name :educated, Author :tara westover, Year of publication :2018, Genre :biography

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:8
enter the genre:biography
Name :educated, Author :tara westover, Year of publication :2018, Genre :biography

=== Libary Management System === 
0. Show menu in spanish
1. Add a book
2. List books
3. Search for a book
4. Update a book
5. Delete a book
6. Exit
7. List all books
8. Browse by genre
Enter your choice:6
Goodbye!

=end