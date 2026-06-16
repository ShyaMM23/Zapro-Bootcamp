class AudioBook < Book
    attr_accessor :duration_minutes
    def initialize(title,author,year,genre,duration_minutes)
        super(title,author,year,genre)
        raise InvalidInputError, "Duration must be a positive integer" if duration_minutes.to_i <= 0
        @duration_minutes = duration_minutes
    end
    def display
        super
        d_hours = @duration_minutes / 60
        d_min = @duration_minutes % 60
        puts "Duration: #{d_hours}h #{d_min}m"
        puts "-"*20
    end
end