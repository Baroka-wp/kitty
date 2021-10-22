class Chat < ApplicationRecord
  belongs_to :order
  validates :message, presence: true
end
