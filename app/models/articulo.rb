class Articulo < ApplicationRecord
  has_many :comentarios, dependent: :destroy
  validates :title, presence: true,
                    length: { minimum: 5 }
end
