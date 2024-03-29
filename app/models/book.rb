class Book < ApplicationRecord
    
    validates :title, presence: true
    validates :page_count, presence: true, numericality: true
    validates :fiction, inclusion: { in: [true, false]}
    
    belongs_to :author

    def self.alphabetize_books(sort)
        sort == 'true' ? order(:title) : Book.all
    end

    def self.page_max(max)
        where("page_count <= ?", max)
    end
end