class Book < ApplicationRecord
   belongs_to :user
   validates :book_title, presence: true


end
