class AddUserIdToDeadlines < ActiveRecord::Migration
  def change
  	add_column :deadlines, :user_id, :integer
  end
end
