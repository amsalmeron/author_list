class Author < ApplicationRecord

    validates :name, presence: true
    validates :age, presence: true, numericality: true
    validates :alive, inclusion: { in: [true, false] }
    
    has_many :books, dependent: :destroy

    def self.order_created
        order(created_at: :desc)
    end

    def self.order_book_count
        
        # binding.pry
        
        # I know this is ruby :(
        # all.sort { |a, b| b.books.count <=> a.books.count   } 
        Author.find_by_sql(
        "SELECT * FROM authors
        LEFT OUTER JOIN
        (select author_id, count(*) as book_count from books group by author_id)as tmp_count on(id = author_id)
        ORDER BY COALESCE(book_count,0) desc;")  
        
        # left_joins(:books).group(:id).order('COUNT(books.id) DESC')
     end
    

    def book_count
        books.count
    end

    def alphabetize(sort)
        books.alphabetize_books(sort)
    end
    
end