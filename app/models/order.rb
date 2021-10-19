class Order < ApplicationRecord
  belongs_to :user

  enum status: [:ordered, :payed, :in_progess, :sent, :close]

  validates :last_name, :first_name, :email, :adresse, presence: true
  validates :status, inclusion: statuses.keys

end
