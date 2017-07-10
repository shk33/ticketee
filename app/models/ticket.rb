class Ticket < ActiveRecord::Base
  # Validations
  validates :name, presence: true
  validates :description, presence: true, length: { minimum: 10 }

  # Associations
  belongs_to :project
  belongs_to :author, class_name: "User"
  has_many   :attachments, dependent: :destroy

  # Nested Attributes
  accepts_nested_attributes_for :attachments, reject_if: :all_blank
end
