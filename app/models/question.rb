class Question < ApplicationRecord
  belongs_to :test
  has_many :answers
  
  validates :body, presence: true, length: { minimum: 10 }

end
