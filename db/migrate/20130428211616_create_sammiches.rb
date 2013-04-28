class CreateSammiches < ActiveRecord::Migration
  def change
    create_table :sammiches do |t|
      t.string :name
      t.string :image
      t.string :country
      t.string :description

      t.timestamps
    end
  end
end
