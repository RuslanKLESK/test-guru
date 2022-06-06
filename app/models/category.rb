class Category < ApplicationRecord
  has_many :tests

  # scope-метод по умолчанию для получения Категорий, отсортированных по названию в порядке возрастания
  default_scope { order(title: :asc) }

  validates :title, presence: true, uniqueness: true

end
