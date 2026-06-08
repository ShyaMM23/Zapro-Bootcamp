class Book
    attr_accessor :title, :author, :year, :genre 

    def initialize(title, author, year, genre)
        @title = title
        @author = author
        @year = year
        @genre = genre
    end

    def age
        Time.now.year - @year
    end

    def recent?
        if age <= 5
            return true
        end
        false
    end
            
    def display
        puts "Title of the book: #{title}"
        puts "Author of the book: #{author}"
        puts "Year of publication: #{year}"
        puts "Genre: #{genre}"
        puts "Age of the Book: #{age} years"
        puts "-" * 20
    end

end

class Library

    attr_accessor :books

    def initialize
        @books=[]
    end

    def validate_input(value, fieldname)
        if value.strip.empty?
            puts "#{fieldname} cannot be blank"
            return false
        end
        true
    end

    def add(title,author,year,genre)
        @books.push(Book.new(title,author,year,genre))
        puts "Book titled #{title} added successfully "
    end

    def search(title)
        return if !validate_input(title, "Title")
        book = @books.find{ |b| b.title.downcase == title.downcase }
        if !book
            puts "Book not found!"
        else 
            puts "Book Found!"
            book.display
        end
    end

    def list(num = nil)
        col = num ? @books.first(num) : @books
        col.each{ |b| b.display }
    end

    def find(query)
        return if !validate_input(title, "Title")
        book = @books.find { |b| b.title.downcase.include?(query.downcase)}
        if book
            book.display
        else
            puts "Book not found!"
        end
    end

    def delete(query)
        len=@books.length
        return if !validate_input(query, "Title")
        @books.reject! { |b| b.title.downcase == query.downcase }
        if len == @books.length
            puts "No Book found with the given title"
        else
            puts "Book deleted successfully"
        end
    end

    def update_book_title
        print "Enter the current title of the book to update:"
        current_title=gets.chomp
        return if !validate_input(current_title, "New Title")

        book=@books.find{ |b| b.title.downcase == current_title.downcase}
        if !book
            puts "Book not found"
        else
            puts "Enter the new title of the book:"
            new_title = gets.chomp
            puts "Rename #{current_title} -> #{new_title}? (y/n):"
            confirm = gets.chomp.downcase

            if confirm == 'y'
                book.title = new_title.strip
                puts "Book title updated successfully"
            else
                puts "Book title update cancelled"
            end
        end
    end

    def book_summary
        if @books.empty?
        puts "Library is empty."
        else
            oldest_book = @books.min_by{ |b| b.year }
            puts "No of Books in the library: #{@books.length}"
            puts "Last added book Title: #{@books.last.title}"
            puts "oldest book year: #{oldest_book.year}"
            puts "oldest book Title: #{oldest_book.title}"
            c=0

            @books.each{ |b| 
                if b.recent?
                    c+=1
                end
            }
            puts "Number of recent books: #{c}"
            
        end
    end

    def dev_stats
        total_books = @books.count
        puts "total number of books in the library: #{total_books}"

        books_after_2000 = @books.count{ |b| b.year > 2000 }
        puts "Number of books published after 2000: #{books_after_2000}"

        authors = @books.map{ |b| b.author }.uniq
        puts "--- authors in the library ---"
        authors.each{ |auth| puts auth }
    end

    def books_between_years

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

        filtered_books = @books.select{ |b| b.year >= start_year && b.year <= end_year}
        if(filtered_books.empty?)
            puts "No books found in the given range"
        else
            filtered_books.sort_by { |b| b.year }.each{ |b|
                b.display
            }
        end
    end

    def update_book
        print "Enter title to update:"
        title = gets.chomp
        return if !validate_input(title, "Book Title")

        book = @books.find{ |b| b.title.downcase == title.downcase }
        
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
            
            book.title = title1
            book.author = author1
            book.year = year1
            book.genre = genre1
            puts "Book updated successfully!"
        else    
            puts "Book not found!"
        end
    end

    def stats
        if @books.empty?
            return { total: 0 , by_genre: {} , average_year: 0 }
        end 
        by_genre={}
        @books.each{ |b|
            if by_genre[b.genre]
                by_genre[b.genre]+=1
            else
                by_genre[b.genre]=1
            end
        }

        total_years=@books.sum{ |b| b.year }
        return { total: @books.length , by_genre: by_genre , average_year: (total_years/@books.length).round }
    end
        
end

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
    puts "11. Show Stats"
    puts "12. Exit"
end


library=Library.new
loop do
    show_menu
    print "Enter your choice:"
    ch=gets.chomp.to_i
    case ch
    when 1
        print "Enter Book Title:"
        name = gets.chomp
        next if !library.validate_input(name, "Book Title")

        print "enter author name:"
        author = gets.chomp
        next if !library.validate_input(author, "Author name")

        print "Enter year of publication:"
        year = gets.chomp.to_i
        next if !library.validate_input(year.to_s, "Year of publication")

        print "Enter the Genre of the book:"
        gen = gets.chomp
        next if !library.validate_input(gen, "Genre")

        library.add(name, author, year, gen)
    when 2
        library.list(3)
    when 3
        library.list()
    when 4        
        print "Enter title to search:"
        title = gets.chomp
        library.search(title)
    when 5
        library.update_book
    when 6
        print "Enter title to delete:"
        title = gets.chomp
        library.delete(title)
    when 7
        library.dev_stats
    when 8
        library.books_between_years
    when 9
        library.book_summary
    when 10 
        library.update_book_title
    when 11
        s = library.stats
        puts "Total books : #{s[:total]}"
        puts "Books by genre : #{s[:by_genre]}"
        puts "Average year: #{s[:average_year]}"
    when 12
        puts "Goodbye!"
        break
    else
        puts "Invalid choice try again!"
    end
    puts "\n"
end