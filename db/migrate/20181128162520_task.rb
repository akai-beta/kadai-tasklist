class Task < ActiveRecord::Migration[5.0]
  def change
    #t.references :user, foreign_key: true
    add_reference :tasks, :user, foreign_key: true
  end
end
