class AddColumnToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :name_first_kanji, :string, null: false, default: ""
    add_column :customers, :name_last_kanji, :string, null: false, default: ""
    add_column :customers, :name_first_kana, :string, null: false, default: ""
    add_column :customers, :name_last_kana, :string, null: false, default: ""
    add_column :customers, :phone_number, :integer
  end
end
