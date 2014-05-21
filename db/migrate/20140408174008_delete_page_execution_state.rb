class DeletePageExecutionState < ActiveRecord::Migration
  def change
      remove_column :pages,:execution_state
  end
end
