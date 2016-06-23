class Category < ActiveRecord::Base
  belongs_to :sector
  has_many :box , dependent: :destroy

  # validaciones de categoria
    validates   :nombre, presence: true
	validates   :cod, presence: true ,format: { with: /\A[a-zA-Z]+\z/,message: "El formato a ingresar es caracteres. " } ,length: { minimum: 1} , length: { maximum: 1 }
	#validates :cod, uniqueness: true 
	#validates :nombre, uniqueness: true 
end
