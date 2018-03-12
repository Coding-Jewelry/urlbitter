class AddUserIdToShortenurls < ActiveRecord::Migration[5.1]
  def change
    add_column :shortenurls, :user_id, :integer
  end
end
