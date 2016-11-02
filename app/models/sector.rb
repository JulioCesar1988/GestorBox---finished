class Sector < ActiveRecord::Base
	has_many :categories , dependent: :destroy
	has_many :boxes , dependent: :destroy
    has_many :users ,dependent: :destroy

    # Validaciones de los campos de sector . 
    validates :nombre, presence: true 
	#  Para que solo ingrese letras sin espacios,format: { with: /\A[a-zA-Z]+\z/,message: "El formato a ingresar es caracteres. " }
	validates :cod, presence: true ,length: { minimum: 2} , length: { maximum: 2 }
	validates :cod, uniqueness: true 
	validates :nombre, uniqueness: true 

end
