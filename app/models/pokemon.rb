class Pokemon < ApplicationRecord
  has_many :pokemon_poketypes
  has_many :poketypes, :through => :pokemon_poketypes

  validates :name, presence: true, uniqueness: true
  attribute :image, default: 'https://bulma.io/images/placeholders/128x128.png'
end
