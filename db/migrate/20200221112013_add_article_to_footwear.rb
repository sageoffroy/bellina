class AddArticleToFootwear < ActiveRecord::Migration[5.2]
  def change
    add_column :footwears, :article, :string
  end
end
