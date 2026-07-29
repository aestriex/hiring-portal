class CreateSections < ActiveRecord::Migration[8.1]
  def change
    create_table :sections do |t|
      t.references :job_posting, null: false, foreign_key: true
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
