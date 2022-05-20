class User < ApplicationRecord
  # has_and_belongs_to_many :tests
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :autors, class_name: 'Test', foreign_key: "test_id"

  def all_tests_of_user_by_level(level)
    # Test.where(level: level).joins('JOIN tests_users ON tests_users.test_id = tests.id').where(tests_users: {user_id: id})
    # Test.where(level: level).joins(:tests_users).where(tests_users: {user_id: id})  #better
    # и тут началось:
    # Test.where(level: level).joins(:tests_users).where(user_id: id).pluck(:title)  # pp Test.all.where(level: 3).joins(:tests_users)
    #  Test.where(level: level).joins(tests_users: {user_id: id}).pluck(:title)  #better
    # Test.joins(TestsUsers).where(level: level, user_id: id)
    # - Test.joins(:tests_users).where("level = #{level} AND user_id = id").pluck(:title)
    # Test.joins(:tests_users).where("level =? AND user_id == ?", level, id)  #не получается user_id указать текущего пользователя
    #Test.joins(:tests_users).find_by(level: level, user_id: id)
    #Test.where(level: level).joins(:tests_users).where(user_id: id)
    tests.where(level: level).joins(:tests_users).where(tests_users: {user_id: id}) # в нсоле: u = User.last, u.all_tests_of_user_by_level(2)  = Получаю 3 теста, вместо одного...
  end
end
