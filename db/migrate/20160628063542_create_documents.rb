class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.text :description

      t.timestamps
    end
  end
end
