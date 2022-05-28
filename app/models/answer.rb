class Answer < ApplicationRecord
  belongs_to :question

  # scope-метод для выбора правильных Ответов:
   scope :right, -> { where(correct: true) }

   validates :title, presence: true
   validates :question_id, presence: true
   validate :validate_max_answers

 private

 def validate_max_answers
    errors.add('You cannot add more than 4 answers') if question.answers.length > 4
 end

end
