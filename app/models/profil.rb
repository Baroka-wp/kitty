class Profil < ApplicationRecord
  belongs_to :user

  has_one_attached :avatar
  has_one_attached :document

  enum status: [:pending, :valide, :certified]

  def type_of_doc
    case self.doc_type
    when 1
      return "CNI"
    when 2
      return "Passport"
    when 3
      return "RAVIP"
    end
  end

end
