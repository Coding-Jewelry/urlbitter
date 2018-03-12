class AddNameToShortenurls < ActiveRecord::Migration[5.1]
  def change
    add_column :shortenurls, :name, :string
  end
end
