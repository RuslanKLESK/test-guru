class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id' # without migration 'author_id' to PG
  has_many :questions
  has_many :tests_users                    # has_and_belongs_to_many :users
  has_many :users, through: :tests_users   # has_and_belongs_to_many :users

  # Для выбора Тестов по уровню сложности  easy "0-1"   middle "2-4"  higher "5- ...""
  scope :easy,   -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :higher, -> { where(level: 5..Float::INFINITY) }

  scope :all_tests_of_category, -> (category) { Test.joins(:category).where(categories: {title: category}).order(title: :desc).pluck(:title) }

  validates :title, presence: true
  validates :title, :level, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :validate_max_level, on: :create
  
  private

  def validate_max_level
    errors.add(:level) if level.to_i >10
  end

end
