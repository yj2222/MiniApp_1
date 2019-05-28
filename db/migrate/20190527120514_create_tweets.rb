class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string      :name, null: false
      t.text        :text, null: false
      t.timestamps
    end
  end
end
