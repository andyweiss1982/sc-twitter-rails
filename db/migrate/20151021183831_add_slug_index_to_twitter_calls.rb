class AddSlugIndexToTwitterCalls < ActiveRecord::Migration
  def change
    add_index :twitter_calls, :slug
  end
end
