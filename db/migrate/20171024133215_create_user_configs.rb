class CreateUserConfigs < ActiveRecord::Migration[5.0]
  def change
    create_table :user_configs do |t|
      t.references :user, index: true
      t.integer :invitation_type
      t.timestamps
    end

  add_foreign_key :user_configs, :users
  end
end
