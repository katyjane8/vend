class CreateMachineSnacks < ActiveRecord::Migration[5.1]
  def change
    create_table :machine_snacks do |t|
      t.integer :snack_id
      t.integer :machine_id
    end
  end
end
