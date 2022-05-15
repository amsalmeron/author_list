class Book < ApplicationRecord
    
    validates :title, presence: true
    validates :page_count, presence: true, numericality: true
    validates :fiction, inclusion: { in: [true, false]}
    
    belongs_to :author
end