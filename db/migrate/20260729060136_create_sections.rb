class CreateSections < ActiveRecord::Migration[8.1]
  def change
    create_table :sections, id: :uuid do |t|
      t.references :job_posting, null: false, foreign_key: true, type: :uuid
      t.string :title
      t.integer :position

      t.timestamps
    end
  end
end
