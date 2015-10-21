class AddSlugToTwitterCalls < ActiveRecord::Migration
  def change
    add_column :twitter_calls, :slug, :string
  end
end
