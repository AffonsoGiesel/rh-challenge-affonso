class Email < ApplicationRecord
  belongs_to :funcionario, optional: true

  validates :endereço_email, :uniqueness => true

end
