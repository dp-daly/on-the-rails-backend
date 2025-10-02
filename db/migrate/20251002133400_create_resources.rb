class CreateResources < ActiveRecord::Migration[7.2]
  def change
    create_table :resources do |t|
      t.string :title
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
