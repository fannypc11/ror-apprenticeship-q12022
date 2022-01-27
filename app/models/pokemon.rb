class Pokemon < ApplicationRecord
  has_many :pokemon_poketypes, dependent: :destroy
  has_many :poketypes, :through => :pokemon_poketypes

  validates :name, presence: true, uniqueness: true
  attribute :image, default: 'https://bulma.io/images/placeholders/128x128.png'

  scope :sorted, lambda { order('name ASC') }
  scope :search, lambda { |query| where(['name LIKE ?', "%#{query}%"]) }
end
