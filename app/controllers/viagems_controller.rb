class ViagemsController < ApplicationController
  before_action :set_viagem, only: [:show, :edit, :update, :destroy]

  # GET /viagems
  # GET /viagems.json
  def index
    @viagems = Viagem.search(params[:search])
  end

  # GET /viagems/1
  # GET /viagems/1.json
  def show
    @viagem = Viagem.find(params[:id])
  end

  # GET /viagems/new
  def new
    @viagem = Viagem.new
  end

  # GET /viagems/1/edit
  def edit
    @viagem = Viagem.find(params[:id])
  end

  # POST /viagems
  # POST /viagems.json
  def create
    @viagem = Viagem.new(viagem_params)

    respond_to do |format|
      if @viagem.save
        format.html { redirect_to @viagem, notice: 'Viagem foi agendada com sucesso' }
        format.json { render :show, status: :created, location: @viagem }
        @veiculo = @viagem.veiculo
        @veiculo.setAlocado(true)
        @veiculo.save
      else
        format.html { render :new }
        format.json { render json: @viagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viagems/1
  # PATCH/PUT /viagems/1.json
  def update
    respond_to do |format|
      if @viagem.update(viagem_params)
        format.html { redirect_to @viagem, notice: 'As informações da viagem foram atualizadas com sucesso' }
        format.json { render :show, status: :ok, location: @viagem }
      else
        format.html { render :edit }
        format.json { render json: @viagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viagems/1
  # DELETE /viagems/1.json
  def destroy
    @viagem.destroy
    respond_to do |format|
      format.html { redirect_to viagems_url, notice: 'Viagem foi desagendada com sucesso' }
      format.json { head :no_content }
    end
  end

  public
  def confirmarRealizacao
    @veiculo = @viagem.veiculo
    @veiculo.setAlocado(false)
    @veiculo.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viagem
      @viagem = Viagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viagem_params
      params.require(:viagem).permit(:usuario_id, :veiculo_id, :motorista_id, :distanciaPercorrida, :nomeRequisor, :finalidade, :funcaoRequisitor, :cpfRequisitor, :descricaoImprevistos, :numAcompanhantes, :dataPartida, :dataChegada, :destino, :horaSaida, :horaChegada)
    end
end
