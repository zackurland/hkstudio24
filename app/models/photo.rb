class Photo < Asset
  has_attached_file :attachment, :styles => { :thumbnail => "128x128>", :medium => "512x512>" }
  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
end
