class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :matched_word
      t.string :main_word
      t.references :document, polymorphic: true
      t.string :column_name

      t.timestamps
    end
  end
end
