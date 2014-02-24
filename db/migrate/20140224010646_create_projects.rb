class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.boolean :active, :default => true
      t.string :created_by
      t.string :from_ip

      t.timestamps
    end
  end
end
