class Product < ApplicationRecord
  has_many :line_items, dependent: :nullify
  belongs_to :user
  belongs_to :category
  belongs_to :subcategory
  has_one_attached :image_url
  validates :title, :description, :image_url, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 1 }
  validates :title, uniqueness: { case_sensitive: false }


  def delivered_time
    case self.delivered
    when 1
      return "1 day"
    when 2
      return "2 day"
    when 3
      return "3 day"
    when 4
      return "4 day"
    when 5
      return "5 day"
    when 6
      return "6 day"
    when 7
      return "7 day"
    end
  end
  #validates :image_url,format: {with: /\.(jpg|png|gif|jpeg)\z/i,message: 'Doit être au format jpg, png ou gif'},
                        #allow_blank: true

end
