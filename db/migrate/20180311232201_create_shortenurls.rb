class CreateShortenurls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortenurls do |t|
      t.string :key
      t.string :originalUrl

      t.timestamps
    end
  end
end
