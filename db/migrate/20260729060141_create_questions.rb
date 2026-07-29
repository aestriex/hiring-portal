class CreateQuestions < ActiveRecord::Migration[8.1]
  def change
    create_table :questions, id: :uuid do |t|
      t.references :section, null: false, foreign_key: true, type: :uuid
      t.string :question_type
      t.string :label
      t.boolean :required
      t.text :options
      t.integer :position

      t.timestamps
    end
  end
end
