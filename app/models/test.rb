class Test < ApplicationRecord
  belongs_to :category

  def self.all_test_of_category(category)
    Test.joins(:category).where(title: category).order(id: :desc)
  end

end
