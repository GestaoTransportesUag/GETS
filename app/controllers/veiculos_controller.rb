class VeiculosController < ApplicationController
  before_action :set_veiculo, only: [:show, :edit, :update, :destroy]

  # GET /veiculos
  # GET /veiculos.json
  def index
    @veiculos = Veiculo.search(params[:search])
  end

  # GET /veiculos/1
  # GET /veiculos/1.json
  def show
    @veiculo = Veiculo.find(params[:id])
  end

  # GET /veiculos/new
  def new
    @veiculo = Veiculo.new
  end

  # GET /veiculos/1/edit
  def edit
    @veiculo = Veiculo.find(params[:id])
  end

  # POST /veiculos
  # POST /veiculos.json
  def create
    @veiculo = Veiculo.new(veiculo_params)

    respond_to do |format|
      if @veiculo.save
        format.html { redirect_to @veiculo, notice: 'Veículo cadastrado com sucesso' }
        format.json { render :show, status: :created, location: @veiculo }
      else
        format.html { render :new }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veiculos/1
  # PATCH/PUT /veiculos/1.json
  def update
    respond_to do |format|
      if @veiculo.update(veiculo_params)
        format.html { redirect_to @veiculo, notice: 'As informações do veículo foram atualizadas com sucesso' }
        format.json { render :show, status: :ok, location: @veiculo }
      else
        format.html { render :edit }
        format.json { render json: @veiculo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculos/1
  # DELETE /veiculos/1.json
  def destroy
    @veiculo.destroy
    respond_to do |format|
      format.html { redirect_to veiculos_url, notice: 'O cadastro do veículo foi removido com sucesso' }
      format.json { head :no_content }
    end
  end

  def getPlaca
    return @veiculo.placa
  end

  def setPlaca(novaPlaca)
    @veiculo.placa = novaPlaca
  end

  def getModelo
    return @veiculo.modelo
  end

  def setModelo(novoModelo)
    @veiculo.modelo = novoModelo
  end

  def getAno
    return @veiculo.ano
  end

  def setAno(novoAno)
    @veiculo.ano = novoAno
  end

  def getCor
    return @veiculo.cor
  end

  def setCor(novaCor)
    @veiculo.cor = novaCor
  end

  def getQuilometragem
    return @veiculo.quilometragem
  end

  def setQuilometragem(novaQuilometragem)
    @veiculo.quilometragem = novaQuilometragem
  end

  def getManutencaoEmDia
    return @veiculo.manutencaoEmDia
  end

  def setManutencaoEmDia(novaManutencaoEmDia)
    @veiculo.manutencaoEmDia = novaManutencaoEmDia
  end

  def getAlocado
    return @veiculo.alocado
  end

  def setAlocado(novoAlocado)
    @veiculo.alocado = novoAlocado
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo
      @veiculo = Veiculo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veiculo_params
      params.require(:veiculo).permit(:placa, :modelo, :ano, :cor, :quilometragem, :manutencaoEmDia, :alocado, :search)
    end
end
