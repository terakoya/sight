class CreateCaptures < ActiveRecord::Migration
  def change
    create_table :captures do |t|
      t.string :captured_url
      t.string :image_url

      t.timestamps
    end
  end
end
