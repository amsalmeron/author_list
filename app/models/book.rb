class Book < ApplicationRecord
    
    validates_presence_of :title
    validates :page_count, presence: true, numericality: true
    validates_presence_of :fiction
    
    belongs_to :author
end