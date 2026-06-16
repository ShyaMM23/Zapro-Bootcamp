module Searchable
    def find_by_title(query)
        book = @books.find{ |b| b.title.downcase == query.downcase }
        raise BookNotFoundError, "Book not found" if book.nil?
        return book
    end
end