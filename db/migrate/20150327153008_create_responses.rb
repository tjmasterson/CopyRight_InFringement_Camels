class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :choice
      t.belongs_to :voter
      t.belongs_to :survey
    end
  end
end
