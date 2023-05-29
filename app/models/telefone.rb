class Telefone < ApplicationRecord
  belongs_to :funcionario, optional: true

  validates :numero_telefone, :uniqueness => true

end
