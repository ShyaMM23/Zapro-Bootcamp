require_relative '../ui/validators'

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

    def add_audio_book(title, author, year, genre, duration)
        @books.push(AudioBook.new(title, author, year, genre, duration))
        puts "Audiobook added successfully"
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
        return if !validate_input(current_title, "Current Title")

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
        start_year = Validators.validate_year(gets.chomp)

        print "Enter end year:"
        end_year = Validators.validate_year(gets.chomp)
        
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
            year1 = Validators.validate_year(gets.chomp)
            
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