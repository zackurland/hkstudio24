class Pdf < Asset
  has_attached_file :attachment
  validates_attachment :attachment, content_type: { content_type: "application/pdf" }
end
