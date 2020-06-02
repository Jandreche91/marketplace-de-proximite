class AddReferencesToCourgettes < ActiveRecord::Migration[6.0]
  def change
    add_reference  :courgettes, :user, null: false, foreign_key: true
  end
end
