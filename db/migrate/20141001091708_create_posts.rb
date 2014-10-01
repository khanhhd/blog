class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.timestamps
    end
    Post.create(title: "post dau tien", body: "Noi dung 1")
    Post.create(title: "Post thu 2",    body: "Noi dung 2")
    Post.create(title: "Post thu 3", body: "Noi dung 3")
  end
end
