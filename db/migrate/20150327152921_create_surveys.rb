class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :description
      t.belongs_to :creator
    end
  end
end
