class CreateSqrtDbs < ActiveRecord::Migration[7.1]
  def change
    create_table :sqrt_dbs do |t|
      t.integer :input
      t.json :result

      t.timestamps
    end
  end
end
