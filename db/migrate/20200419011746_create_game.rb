class CreateGame < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string  :game_id
      t.text    :game_state
      t.timestamps
    end
  end
end
