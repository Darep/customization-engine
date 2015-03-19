class CreateCustomizations < ActiveRecord::Migration
  def change
    create_table :customizations do |t|
      t.text :css
      t.text :settings

      t.timestamps null: false
    end
  end
end
