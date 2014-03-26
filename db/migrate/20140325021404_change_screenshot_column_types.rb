class ChangeScreenshotColumnTypes < ActiveRecord::Migration
  def change
    change_column :screenshots,:url,:string
    change_column :screenshots,:netid,:string
    change_column :screenshots,:execution_state,:string
  end
end
