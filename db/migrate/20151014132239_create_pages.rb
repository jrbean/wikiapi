class CreatePages < ActiveRecord::Migration

  def change

    create_table :pages do |t|
      t.string :title
      t.string :prelude
      t.string :preview
      t.string :url
    end

    create_table :links do |t|
      t.integer :from_page_id
      t.integer :to_page_id
    end

  end
end
