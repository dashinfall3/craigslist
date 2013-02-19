class AddSecretToPost < ActiveRecord::Migration
  def change
    add_column :posts, :secret_key, :string
  end
end
