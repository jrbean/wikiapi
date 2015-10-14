class ChangeColumnType < ActiveRecord::Migration
  def change
    change_column :pages, :prelude, :text
    change_column :pages, :preview, :text
  end
end
