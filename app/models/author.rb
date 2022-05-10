class Author < ApplicationRecord

    validates_presence_of :name
    validates :age, presence: true, numericality: true
    validates_presence_of :alive, boolean: true
    
    has_many :books

end