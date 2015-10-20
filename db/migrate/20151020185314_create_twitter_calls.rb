class CreateTwitterCalls < ActiveRecord::Migration
  def change
    create_table :twitter_calls do |t|
      t.string :handle

      t.timestamps null: false
    end
  end
end
