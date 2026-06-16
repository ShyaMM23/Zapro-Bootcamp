class DigitalBook < Book
    attr_accessor :url
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