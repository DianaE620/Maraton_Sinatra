class CreateGame < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :pass
    end

    create_table :decks do |t|
      t.string :name
    end

    create_table :cards do |t|
      t.string :question
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.belongs_to :deck, index: true
    end

    create_table :rounds do |t|
      t.integer :right
      t.integer :wrong
      t.timestamps
      t.belongs_to :deck, index: true
      t.belongs_to :user, index: true
    end

  end
end
