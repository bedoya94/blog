class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.float :precio
      t.text :descripcion
      t.boolean :disponible

      t.timestamps
    end
  end
end
