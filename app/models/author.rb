class Author < ApplicationRecord

    validates :name, presence: true
    validates :age, presence: true, numericality: true
    validates :alive, inclusion: { in: [true, false] }
    
    has_many :books, dependent: :destroy

    def self.order_created
        order(created_at: :desc)
    end

    def book_count
        books.count
    end
    
end