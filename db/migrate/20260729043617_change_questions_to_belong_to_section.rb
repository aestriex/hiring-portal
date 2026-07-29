class ChangeQuestionsToBelongToSection < ActiveRecord::Migration[8.1]
  def change
    remove_reference :questions, :job_posting, foreign_key: true
    add_reference :questions, :section, null: false, foreign_key: true
  end
end