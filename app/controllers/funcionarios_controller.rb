class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy ]
  before_action :setar_estados, only: %i[ new create edit update]
  before_action :setar_estado_civil, only: %i[ new create edit update]
  before_action :set_workspace_options, only: [:new, :create, :edit, :update]
  before_action :set_job_role_options, only: [:new, :create, :edit, :update]

  # GET /funcionarios or /funcionarios.json
  def index
    @funcionarios = Funcionario.all.order('nome ASC')
    
  @funcionarios = @funcionarios.where(nil) # creates an anonymous scope
  @funcionarios = @funcionarios.filtrar_por_sexo(params[:sexo]) if params[:sexo].present?
  #@funcionarios = @funcionarios.filtrar_por_locacao(params[:lotacao]) if params[:lotacao].present?
  #@funcionarios = @funcionarios.filtrar_por_cargo(params[:cargo]) if params[:cargo].present?
  @funcionarios = @funcionarios.pesquisar_por_nome(params[:nome]) if params[:nome].present?
  @funcionarios = @funcionarios.pesquisar_por_matricula(params[:matricula]) if params[:matricula].present?

  end

  # GET /funcionarios/1 or /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
    @funcionario.emails.build
    @funcionario.telefones.build
    @funcionario.celulars.build
  end

  # GET /funcionarios/1/edit
  def edit
    @funcionario.emails.build
    @funcionario.telefones.build
    @funcionario.celulars.build    
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to @funcionario, notice: "Funcionário Criado!" }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end
    
  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to @funcionario, notice: "Funcionário Atualizado!" }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    @funcionario.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionário apagado!" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :matricula, :data_nascimento, :sexo, :lotacao,
      :cargo, :municipio_nascimento, :estado_nascimento, :estado_civil, :workspace_id, :job_role_id,
      emails_attributes: Email.attribute_names.map(&:to_sym).push(:_destroy),
      telefones_attributes: Telefone.attribute_names.map(&:to_sym).push(:_destroy),
      celulars_attributes: Celular.attribute_names.map(&:to_sym).push(:_destroy))
    end

    def setar_estados
      @estados = ['Acre', 'Alagoas', 'Amapá', 'Amazonas' , 'Bahia', 'Ceará', 'Distrito Federal', 'Espírito Santo',
       'Goiás', 'Maranhão', 'Mato Grosso', 'Mato Grosso do Sul', 'Minas Gerais', 'Pará', 'Paraíba', 'Paraná',
       'Pernambuco', 'Piauí', 'Rio de Janeiro', 'Rio Grande do Norte', 'Rio Grande do Sul', 'Rondônia', 'Roraima',
       'Santa Catarina', 'São Paulo', 'Sergipe', 'Tocantins']
    end

    def setar_estado_civil
      @estadocivil = ['Solteiro(a)', 'Casado(a)', 'Divorciado(a)', 'Viúvo(a)']
    end

    def set_workspace_options
      @workspace_options = Workspace.all.pluck(:title, :id)
    end

    def set_job_role_options
      @job_role_options = JobRole.all.pluck(:title, :id)
    end

end
