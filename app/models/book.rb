class Book < ApplicationRecord
    
    validates_presence_of :title
    validates :page_count, presence: true, numericality: true
    validates :fiction, inclusion: { in: [true, false]}
    
    belongs_to :author
end