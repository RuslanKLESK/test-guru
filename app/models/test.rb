class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  # has_and_belongs_to_many :users
  has_many :tests_users
  has_many :users, through: :tests_users

  def self.all_tests_of_category(category)
    Test.joins('JOIN categories ON tests.category_id = categories.id').where('categories.title = :title', title: category).order(title: :desc).pluck(:title) #it`s work!
  end
end
