class AddDefaultToIdeas < ActiveRecord::Migration
  def change
    change_column_default :ideas, :quality, 0
  end
end
