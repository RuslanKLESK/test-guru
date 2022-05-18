class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :tests do |t|
      t.index [:user_id, :test_id]    # unique: true - Уникальность ограничивает возможность приложения, не допуская повторных прохождений Тесттов Пользователем.
      # t.index [:test_id, :user_id], # Индексирование - ускоряет поиск по этой связке.
      t.integer :progress, default: 0
      t.primary_key :id

      t.timestamps
    end
  end
end
