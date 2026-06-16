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
