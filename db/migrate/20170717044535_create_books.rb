class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :isbn
      # TODO: replace content with filepath
      t.string :content
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
