class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
    	t.references :attended_event
    	t.references :attendee

      t.timestamps null: false
    end
  end
end
