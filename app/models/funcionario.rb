class Funcionario < ApplicationRecord
  
  belongs_to :workspace
  belongs_to :job_role
  
  has_many :emails, dependent: :destroy
  accepts_nested_attributes_for :emails, allow_destroy: true, reject_if: proc { |att| att['endereço_email'].blank? }
  
  has_many :telefones, dependent: :destroy
  accepts_nested_attributes_for :telefones, allow_destroy: true, reject_if: proc { |att| att['numero_telefone'].blank? }

  has_many :celulars, dependent: :destroy
  accepts_nested_attributes_for :celulars, allow_destroy: true, reject_if: proc { |att| att['numero_celular'].blank? }
  


  #Usando delegate apra acessar os títulos de workspace e jobrole na funcionários#index na lista.
  #Precisamos do allow_nil.
  delegate :title, to: :workspace, prefix: true, allow_nil: true
  delegate :title, to: :job_role, prefix: true, allow_nil: true
  

    #Campos obrigatórios de serem preenchidos e únicos. Isso é apenas uma garantia já que fizemos isso já pelo HTML no form.
    validates :nome, :matricula, :presence => true
    validates :matricula, :uniqueness => true

    #Filtros
  scope :filtrar_por_sexo, -> (sexo) { where sexo: sexo }
  #scope :filtrar_por_lotacao, -> (lotacao) { where lotacao: lotacao }
  #scope :filtrar_por_cargo, -> (cargo) { where cargo: cargo }
  scope :pesquisar_por_nome, -> (nome) { where("nome like ?", "#{nome}%")}
  scope :pesquisar_por_matricula, -> (matricula) { where("matricula like ?", "#{matricula}%")}

end
