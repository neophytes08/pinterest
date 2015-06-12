class AddAttachmentPictureToUserInfos < ActiveRecord::Migration
  def self.up
    change_table :user_infos do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :user_infos, :picture
  end
end
