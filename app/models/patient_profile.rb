class PatientProfile < ActiveRecord::Base
  has_many :farm_notes, :as => :has_farm_notes, dependent: :destroy
  accepts_nested_attributes_for :farm_notes, :allow_destroy => true

  has_one :contact_info, dependent: :destroy
  accepts_nested_attributes_for :contact_info, :allow_destroy => true

  mount_uploader :certification, PaperDocumentUploader, :dependent => :destroy
  mount_uploader :state_id, IdCardUploader, :dependent => :destroy
end
