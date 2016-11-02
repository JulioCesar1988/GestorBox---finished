class History < ActiveRecord::Base
  belongs_to :user
  belongs_to :box
  belongs_to :sector # para asociar las historias con un sector 
  validates :observacion , presence:true # verificacmos que el campo descripcion no sea null 
  validates :box_id , :presence => true
  validates :user_id , :presence => true

end
