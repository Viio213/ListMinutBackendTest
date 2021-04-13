class AddColumnsToJob < ActiveRecord::Migration[6.1]
  def change
    add_column :jobs, :temp, :decimal
    add_column :jobs, :tempfeels, :decimal
    add_column :jobs, :iconurl, :text
    add_column :jobs, :icondescription, :text
  end
end
