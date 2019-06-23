class AddArticleIdToDiscussions < ActiveRecord::Migration[5.2]
  def change
    add_column :discussions, :article_id, :integer
  end
end
