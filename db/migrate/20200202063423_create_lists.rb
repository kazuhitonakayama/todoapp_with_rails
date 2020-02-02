class CreateLists < ActiveRecord::Migration[6.0]
  def change
    create_table :lists do |t|
      # ==========titleカラムの追加、アソシエーションの導入部分==========
      t.string :title, null: false
      t.references :user, foreign_key: true, null: false
      # ==========titleカラムの追加、アソシエーションの導入部分==========

      
      t.timestamps
    end
  end
end
