class RenameStatusScreenshots < ActiveRecord::Migration
  def change
    rename_column :screenshots,:status, :execution_state
  end
end
