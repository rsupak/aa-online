class CreateSuperheros < ActiveRecord::Migration[5.2]
  def change
    create_table :superheros do |t|
      t.string :name, null: false
      t.string :alias

      t.timestamps
    end
  end
end
