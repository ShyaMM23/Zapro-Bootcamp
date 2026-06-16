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