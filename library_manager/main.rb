require 'csv'
require 'fileutils'

require_relative 'errors/custom_errors'

require_relative 'modules/displayable'
require_relative 'modules/searchable'
require_relative 'modules/exportable'

require_relative 'ui/menu'
require_relative 'ui/validators'

require_relative 'models/book'
require_relative 'models/digital_book'
require_relative 'models/audio_book'
require_relative 'models/library'

require_relative 'services/file_handler'

library = Library.new
FileHandler.load_library(library)

at_exit do
  FileHandler.backup_library
  FileHandler.save_library(library)
end

begin
    loop do
        Menu.show
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
            year = Validators.validate_year(gets.chomp)

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
            year = Validators.validate_year(gets.chomp)

            print "Enter the Genre of the book:"
            gen = gets.chomp
            next if !library.validate_input(gen, "Genre")

            print "Enter the url:"
            url = gets.chomp
            next if !library.validate_input(url, "URL")

            library.add_digital_book(name, author, year, gen,url)
            
        when 10 
            print "Enter Book Title:"
            name = gets.chomp
            next if !library.validate_input(name, "Book Title")

            print "Enter author name:"
            author = gets.chomp
            next if !library.validate_input(author, "Author name")

            print "Enter year of publication:"
            year = Validators.validate_year(gets.chomp)
            
            print "Enter Genre:"
            genre = gets.chomp
            next if !library.validate_input(genre, "Genre")

            print "Enter duration in minutes:"
            duration = gets.chomp.to_i

            library.add_audio_book(name, author, year, genre, duration)
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
            library.update_book_title
        when 15
            puts "Goodbye!"
            break
        else
            puts "Invalid choice try again!"
        end
        puts "\n"
    end
    rescue BookNotFoundError => e
        puts e.message
    rescue InvalidInputError => e
        puts e.message
end