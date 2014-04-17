class FixCardColumnName < ActiveRecord::Migration
  def change
  	rename_column :cards, :type, :name
  end
end
