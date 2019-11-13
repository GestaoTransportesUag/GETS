class ManutencaosController < ApplicationController
  before_action :set_manutencao, only: [:show, :edit, :update, :destroy]

  # GET /manutencaos
  # GET /manutencaos.json
  def index
    @manutencaos = Manutencao.search(params[:search])
  end

  # GET /manutencaos/1
  # GET /manutencaos/1.json
  def show
    @manutencaos = Manutencao.find(params[:id])

  end

  # GET /manutencaos/new
  def new
    @manutencao = Manutencao.new
    @usuario = Usuario.all
    @veiculo = Veiculo.all
  end

  # GET /manutencaos/1/edit
  def edit
    @manutencaos = Manutencao.find(params[:id])
  end

  # POST /manutencaos
  # POST /manutencaos.json
  def create
    @manutencao = Manutencao.new(manutencao_params)

    respond_to do |format|
      if @manutencao.save
        format.html { redirect_to @manutencao, notice: 'Manutenção foi registrada com sucesso' }
        format.json { render :show, status: :created, location: @manutencao }
      else
        format.html { render :new }
        format.json { render json: @manutencao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manutencaos/1
  # PATCH/PUT /manutencaos/1.json
  def update
    respond_to do |format|
      if @manutencao.update(manutencao_params)
        format.html { redirect_to @manutencao, notice: 'As informações da manutenção foram atualizadas com sucesso' }
        format.json { render :show, status: :ok, location: @manutencao }
      else
        format.html { render :edit }
        format.json { render json: @manutencao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manutencaos/1
  # DELETE /manutencaos/1.json
  def destroy
    @manutencao.destroy
    respond_to do |format|
      format.html { redirect_to manutencaos_url, notice: 'A manutenção foi removida dos registros com sucesso' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manutencao
      @manutencao = Manutencao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manutencao_params
      params.require(:manutencao).permit(:usuario_id, :veiculo_id, :descricao, :custo, :realizadoEm, :realizadoQuando)
    end
end
