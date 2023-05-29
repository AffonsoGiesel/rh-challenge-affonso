class Celular < ApplicationRecord
  belongs_to :funcionario, optional: true

  validates :numero_celular, :uniqueness => true

end
