class AddTimestapms < ActiveRecord::Migration[7.0]
  def change
    add_timestamps :tokens ,null:true
  end
end
