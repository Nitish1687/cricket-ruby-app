class Brand < ApplicationRecord
  belongs_to :player
  validates :name, :description, presence: true
  validates :description, length: {maximum: 20}

  mount_uploader :attachment, AttachmentUploader
end
