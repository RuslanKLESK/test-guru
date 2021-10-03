class Test < ApplicationRecord
  belongs_to :category

  def self.all_test_of_category(category)
    Test.joins('JOIN categories ON test.category_id = categories.id').where('categories.title = :title', title: Category).order(id: desc)
  end

end
