class AddPasswordDigestToUsers < ActiveRecord::Migration[5.2]
  def change
    # ハッシュ化したパスワードを保存するカラム
    add_column :users, :password_digest, :string
  end
end
