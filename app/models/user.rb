class User < ApplicationRecord
  has_attached_file :avatar, :styles => { :medium => "500x500>" }, :processors => [:cropper]
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  attr_accessor  :crop_x, :crop_y, :crop_w, :crop_h, :processed
  after_update :reprocess_avatar, :if => :cropping?

  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end


  def delete_avatar
    self.avatar = nil
    self.save
  end

  private
  def reprocess_avatar
    return if processed
    avatar.reprocess!
  end
end
