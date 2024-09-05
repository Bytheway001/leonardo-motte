class Match < ApplicationRecord
  belongs_to :contact
  belongs_to :role
 
   # Valida que la combinación de contact_id y role_id sea unica para evitar duplicados
   validates :contact_id, uniqueness: { scope: :role_id, message: 'Este contacto ya está asociado a este rol' }
end
