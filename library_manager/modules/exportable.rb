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