books=[]

def show_menu
    puts "=== Libary Management System === "
    puts "1. Add a book"
    puts "2. List books"
    puts "3. List all books"
    puts "4. Search for a book"
    puts "5. Update a book"
    puts "6. Delete a book"
    puts "7. Dev stats"
    puts "8. Books between years"
    puts "9. Book summary"
    puts "10. Update book title"
    puts "11. Exit"
end

def validate_input(value,fieldname)
    if value.strip.empty?
        puts "#{fieldname} cannot  be blank"
        return false
    end 
    return true
end

def add_books(books)
    print "Enter Book Title:"
    name = gets.chomp
    return if !validate_input(name, "Book Title")

    print "enter author name:"
    author = gets.chomp
    return if !validate_input(author, "Author name")

    print "Enter year of publication:"
    year = gets.chomp.to_i
    return if !validate_input(year.to_s, "Year of publication")

    print "Enter the Genre of the book:"
    gen = gets.chomp
    return if !validate_input(gen, "Genre")
    books.push({name:name,author:author,year:year,genre:gen})
end

def list_books(books)
    display_book(books.first(3))
end

def search_book(books)
    print "Enter book Title to search:"
    title = gets.chomp
    return if !validate_input(title, "Book Title")

    book = books.find{ |b| b[:name].downcase == title.downcase }
    if !book
        puts "Book not found!"
    else 
        puts "Book Found!"
        display_book([book])
    end
end

def update_book(books)
    print "Enter title to update:"
    title = gets.chomp
    return if !validate_input(title, "Book Title")

    book = books.find{ |b| b[:name].downcase == title.downcase }
    if book
        print "Enter new title:"
        title1 = gets.chomp
        return if !validate_input(title1, "Book Title")

        print "Enter new author:"
        author1 = gets.chomp
        return if !validate_input(author1, "Author name")

        print "Enter new year of publication:"
        year1 = gets.chomp.to_i
        return if !validate_input(year1.to_s, "Year of publication")
        
        print "Enter new genre:"
        genre1 = gets.chomp
        return if !validate_input(genre1, "Genre")

        book[:name] = title1
        book[:author] = author1
        book[:year] = year1
        book[:genre] = genre1
        puts "Book updated successfully!"
    else    
        puts "Book not found!"
    end
end

def delete_book(books)
    print "enter title to delete:"
    titl = gets.chomp
    return if !validate_input(titl, "Book Title")

    len = books.length
    books.reject!{ |b|
        b[:name].downcase == titl.downcase
    }
    if len == books.length
        puts "Book not found!"
    else
        puts "Book deleted successfully!"
    end
end

def list_all_books(books)
    display_book(books)
end

def book_summary(books)
    if books.empty?
        puts "Library is empty."
    else
        oldest_book = books.min_by{ |b| b[:year] }
        puts "No of Books in the library: #{books.length}"
        puts "Last added book Title: #{books.last[:name]}"
        puts "oldest book year: #{oldest_book[:year]}"
        puts "oldest book Title: #{oldest_book[:name]}"
    end
end

def dev_stats(books)
    total_books = books.count
    puts "total number of books in the library: #{total_books}"

    books_after_2000 = books.count{ |b| b[:year] > 2000 }
    puts "Number of books published after 2000: #{books_after_2000}"

    authors = books.map{ |b| b[:author] }.uniq
    puts "=== authors in the library==="
    authors.each{ |auth| puts auth }
end

def books_between_years(books)
    print "Enter start year:"
    start_year = gets.chomp.to_i
    return if !validate_input(start_year.to_s, "Start year")

    print "Enter end year:"
    end_year = gets.chomp.to_i
    return if !validate_input(end_year.to_s, "End year")

    if(end_year < start_year)
        puts "Invalid range"
        return 
    end

    filtered_books = books.select{ |b| b[:year] >= start_year && b[:year] <= end_year}
    if(filtered_books.empty?)
        puts "No books found in the given range"
    else
        display_book(filtered_books.sort_by{ |b| b[:year] })
    end
end

def update_book_title(books)
    print "Enter the current title of the book to update:"
    current_title=gets.chomp
    return if !validate_input(current_title, "Current book title")

    book=books.find{ |b| b[:name].downcase == current_title.downcase}
    if !book
        puts "Book not found"
    else
        puts "Enter the new title of the book:"
        new_title = gets.chomp
        return if !validate_input(new_title, "New book title")

        puts "Rename #{current_title} -> #{new_title}? (y/n):"
        confirm = gets.chomp.downcase

        if confirm == 'y'
            book[:name] = new_title.strip
            puts "Book title updated successfully"
        else
            puts "Book title update cancelled"
        end
    end
end


def display_book(books)
    books.each{ |b|
        puts "Name : #{b[:name]}, Author : #{b[:author]}, Year of publication : #{b[:year]}, Genre : #{b[:genre]}"
    }
end

loop do
    show_menu
    print "Enter your choice:"
    ch=gets.chomp.to_i

    case ch
    when 1
        add_books(books)
    when 2
        list_books(books)
    when 3
        list_all_books(books)
    when 4        
        search_book(books)
    when 5
        update_book(books)
    when 6
        delete_book(books)
    when 7
        dev_stats(books)
    when 8
        books_between_years(books)
    when 9
        book_summary(books)
    when 10 
        update_book_title(books)
    when 11
        puts "Goodbye!"
        break
    else
        puts "Invalid choice try again!"
    end
    puts "\n"
end