class BookNotFoundError < StandardError
end

class InvalidInputError < StandardError
end

module Displayable
    def display
        puts "Book title : #{title}"
        puts "Author : #{author}"
        puts "Year of publish : #{year}"
        puts "Genre : #{genre}"
        puts "-" * 20
    end
    def to_s
        "#{title} - #{author} (#{year})"
    end
end

module Searchable
    def find_by_title(query)
        book = @books.find{ |b| b.title.downcase.include?(query.downcase)}
        raise BookNotFoundError, "Book not found" if book.nil?
        return book
    end
end

module Exportable
    def to_csv_row
        col = [title,author,year,genre].map{ |col|
            if col.to_s.include?(",")
                "\"#{col}\""
            else
                col
            end
        }
        col.join(",")
    end
end

def validate_year(year)
    raise InvalidInputError, "Year must be a Number" unless  year.match?(/^\d+$/)
    year.to_i
end

class Book
    include Displayable
    include Comparable
    include Exportable
    attr_accessor :title, :author, :year, :genre
    
    def  initialize(title,author,year,genre)
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
        return false
    end

    def <=>(other)
        @year <=> other.year
    end
end

class DigitalBook < Book
    def initialize(title,author,year,genre,url)
        super(title,author,year,genre)
        @url=url
    end
    def display
        super
        puts "URL: #{@url}"
        puts "-" * 20
    end
end

class Library
    include Searchable
    attr_accessor :books

    def initialize
        @books = []
    end

    def validate_input(value, fieldname)
        if value.strip.empty?
            puts "#{fieldname} cannot be blank"
            return false
        end
        true
    end

    def add_digital_book(title,author,year,genre,url)
        @books.push(DigitalBook.new(title, author, year, genre, url))
        puts "Digital book added successfully"
    end

    def add(title,author,year,genre)
        @books.push(Book.new(title,author,year,genre))
        puts "Book titled #{title} added successfully "
    end

    def list(num = nil)
        col = num ? @books.first(num) : @books
        if col.empty?
            puts "The library is empty"
            return 
        end
        col.each{ |b| b.display }
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

    def update_book_title
        print "Enter the current title of the book to update:"
        current_title=gets.chomp
        return if !validate_input(current_title, "New Title")

        book=find_by_title(current_title)
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
        start_year = validate_year(gets.chomp)

        print "Enter end year:"
        end_year = validate_year(gets.chomp)
        
        if(end_year < start_year)
            puts "Invalid range"
            return 
        end

        filtered_books = @books.select{ |b| b.year >= start_year && b.year <= end_year}
        if(filtered_books.empty?)
            puts "No books found in the given range"
        else
            filtered_books.sort.each{ |b|
                b.display
            }
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
    
    def search(title)
        return if !validate_input(title, "Title")
        book = find_by_title(title)
        puts "Book Found!"
        book.display
    end

    def update_book
        print "Enter title to update:"
        title = gets.chomp
        return if !validate_input(title, "Book Title")

        book = find_by_title(title)
        
        if book
            print "Enter new title:"
            title1 = gets.chomp
            return if !validate_input(title1, "Book Title")

            print "Enter new author:"
            author1 = gets.chomp
            return if !validate_input(author1, "Author name")

            print "Enter new year of publication:"
            year1 = validate_year(gets.chomp)
            
            print "Enter new genre:"
            genre1 = gets.chomp
            return if !validate_input(genre1, "Genre")
            
            book.title = title1
            book.author = author1
            book.year = year1
            book.genre = genre1
            puts "Book updated successfully!"
        end
    end
    
    def export_books(title)
        book=find_by_title(title)
        if book
            puts book.to_csv_row
        end
    end
end

def show_menu
    puts "=== Libary Management System === "
    puts "1. Add a book"
    puts "2. List books"
    puts "3. List all books"
    puts "4. Search for a book"
    puts "5. Update Book"
    puts "6. Delete a book"
    puts "7. Dev stats"
    puts "8. Books between years"
    puts "9. Add a digital Book"
    puts "10. Update book title"
    puts "11. Show Stats"
    puts "12. Export book to clipboard format"
    puts "13. Book Summary"
    puts "14. Exit"
end

library=Library.new
begin
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
            year = validate_year(gets.chomp)

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
            print "Enter Book Title:"
            name = gets.chomp
            next if !library.validate_input(name, "Book Title")

            print "enter author name:"
            author = gets.chomp
            next if !library.validate_input(author, "Author name")

            print "Enter year of publication:"
            year = validate_year(gets.chomp)

            print "Enter the Genre of the book:"
            gen = gets.chomp
            next if !library.validate_input(gen, "Genre")

            print "Enter the url:"
            url = gets.chomp
            next if !library.validate_input(url, "URL")

            library.add_digital_book(name, author, year, gen,url)
            
        when 10 
            library.update_book_title
        when 11
            s = library.stats
            puts "Total books : #{s[:total]}"
            puts "Books by genre : #{s[:by_genre]}"
            puts "Average year: #{s[:average_year]}"
        when 12
            print "Enter the title of the book:"
            title=gets.chomp        
            next if !library.validate_input(title, "Book Title")
            library.export_books(title)
        when 13
            library.book_summary
        when 14
            puts "Goodbye!"
            break
        else
            puts "Invalid choice try again!"
        end
        puts "\n"
        rescue BookNotFoundError => e
            puts e.message
        rescue InvalidInputError => e
            puts e.message
    end
end