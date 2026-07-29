class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions do |t|
      t.references :job_posting, null: false, foreign_key: true
      t.string :question_type
      t.string :label
      t.boolean :required
      t.text :options
      t.integer :position

      t.timestamps
    end
  end
end
