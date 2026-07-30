class CreatePermissions < ActiveRecord::Migration[8.1]
  def change
    create_table :permissions, id: :uuid do |t|
      t.string :key
      t.string :description

      t.timestamps
    end
  end
end
