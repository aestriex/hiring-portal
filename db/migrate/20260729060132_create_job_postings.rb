class CreateJobPostings < ActiveRecord::Migration[8.1]
  def change
    create_table :job_postings, id: :uuid do |t|
      t.string :title
      t.text :description
      t.string :department
      t.string :status

      t.timestamps
    end
  end
end
