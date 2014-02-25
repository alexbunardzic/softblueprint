class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.text :description
      t.boolean :active, :default => true
      t.string :created_by
      t.references :project, index: true

      t.timestamps
    end
  end
end
