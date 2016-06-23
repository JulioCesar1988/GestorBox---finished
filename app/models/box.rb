class Box < ActiveRecord::Base
  belongs_to :sector
  belongs_to :category 
  
 has_many :history , dependent: :destroy
  
  validates :descripcion,presence:true 
  validates :precinto_A , presence: true , numericality: true  
  validates :precinto_B , presence: true , numericality: true  
  validates  :category_id , :presence => true   

end
