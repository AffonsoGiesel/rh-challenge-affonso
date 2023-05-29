#Nossas task customizadas


#Task de gerar o banco de dados automaticamente.
#Colocando um símbolo spinner de carregamento junto com a task.

namespace :dev do
    desc "Configura o ambiente de desenvolvimento."
    task setup: :environment do
      if Rails.env.production?
  
        show_spinner("Apagando Banco de Dados...")do
          %x(rails db:drop)
        end
  
  
        show_spinner("Criando Banco de Dados...")do
          %x(rails db:create)
        end
  
  
        show_spinner("Migrando Banco de Dados...")do
          %x(rails db:migrate)
        end
  
        #Trocando o db:seed pela task dev:add_coins e dev:add_mining_types
  
        #show_spinner("Populando Banco de Dados...")do
        # %x(rails db:seed)
        #end
  
        %x(rails dev:add_workspaces)
        %x(rails dev:add_job_roles)
        %x(rails dev:add_funcionarios)
  
  
      else
      puts "Você não está em ambiente de produção."
      end

      end
  
  
    desc "Task para adicionar novos funcionários."
    task add_funcionarios: :environment do
      show_spinner("Adicionando Funcionarios ...")do
      #Array de hashes com todas as moedas
      funcionarios = [
        {
          nome: "Judy Alvarez",
          matricula: "12345",
          data_nascimento: "01/01/2001",
          sexo: "Feminino",
          municipio_nascimento: "Laguna Bend",
          estado_nascimento: "Sergipe",
          estado_civil: "Casado(a)",
          workspace: Workspace.find_by(title: "Moxxi"),
          job_role: JobRole.find_by(title: "Street Kid")
          
          },

          {
          nome: "Panam Palmer",
          matricula: "123456",
          data_nascimento: "01/01/2001",
          sexo: "Feminino",
          municipio_nascimento: "Badlands",
          estado_nascimento: "Bahia",
          estado_civil: "Solteiro(a)",
          workspace: Workspace.find_by(title: "Aldecados"),
          job_role: JobRole.find_by(title: "Nomad")
          
          },

          {
          nome: "Goro Takemura",
          matricula: "1234567",
          data_nascimento: "01/01/2001",
          sexo: "Masculino",
          municipio_nascimento: "Chiba-11",
          estado_nascimento: "São Paulo",
          estado_civil: "Solteiro(a)",
          workspace: Workspace.find_by(title: "Arasaka"),
          job_role: JobRole.find_by(title: "Corpo")
          
          },

          {
          nome: "Johnny Silverhand",
          matricula: "12345678",
          data_nascimento: "11/16/1988",
          sexo: "Masculino",
          municipio_nascimento: "College Station",
          estado_nascimento: "Goiás",
          estado_civil: "Solteiro(a)",
          workspace: Workspace.find_by(title: "SAMURAI"),
          job_role: JobRole.find_by(title: "Street Kid")
          
          },

          {
          nome: "Hanako Arasaka",
          matricula: "123456789",
          data_nascimento: "03/02/1999",
          sexo: "Feminino",
          municipio_nascimento: "Tokyo",
          estado_nascimento: "Amazonas",
          estado_civil: "Solteiro(a)",
          workspace: Workspace.find_by(title: "Arasaka"),
          job_role: JobRole.find_by(title: "Corpo")
          
          }


  
      ]
      funcionarios.each do |funcionario|
        Funcionario.find_or_create_by!(funcionario)
      end
  
    end
  
  
    end
  
    desc "Task para adicionar Workspaces."
    task add_workspaces: :environment do
      show_spinner("Adicionando Workspaces...")do
      workspaces = [
        {title: "Arasaka"},
        {title: "Militech"},
        {title: "Kang Tao"},
        {title: "Moxxi"},
        {title: "Aldecados"},
        {title: "SAMURAI"}
      ]
  
      workspaces.each do |workspace|
        Workspace.find_or_create_by!(workspace)
        end
      end
    end


    desc "Task para adicionar Job Roles."
    task add_job_roles: :environment do
      show_spinner("Adicionando Job Roles...")do
      job_roles = [
        {title: "Street Kid"},
        {title: "Corpo"},
        {title: "Nomad"}
      ]
  
      job_roles.each do |job_role|
        JobRole.find_or_create_by!(job_role)
        end
      end
    end

  
  
  end
  
  private
  
  def show_spinner(msg_inicial)
    spinner = TTY::Spinner.new("[:spinner] #{msg_inicial}")
    spinner.auto_spin
    #%x(rails db:seed)
    #Onde ficaria a task vamos chamar o 'Yield' para executar a task que existe do lado de fora do método.
    # Mais informações nas anotações na sessão do 'Yield'.
    yield
    spinner.success("(Concluído!)")
  end