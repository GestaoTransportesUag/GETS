class MotoristaController < ApplicationController
  before_action :set_motorista, only: [:show, :edit, :update, :destroy]

  # GET /motorista
  # GET /motorista.json
  def index
    @motorista = Motorista.all
  end

  # GET /motorista/1
  # GET /motorista/1.json
  def show
  end

  # GET /motorista/new
  def new
    @motorista = Motorista.new
  end

  # GET /motorista/1/edit
  def edit
  end

  # POST /motorista
  # POST /motorista.json
  def create
    @motorista = Motorista.new(motorista_params)

    respond_to do |format|
      if @motorista.save
        format.html { redirect_to @motorista, notice: 'Motorista was successfully created.' }
        format.json { render :show, status: :created, location: @motorista }
      else
        format.html { render :new }
        format.json { render json: @motorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motorista/1
  # PATCH/PUT /motorista/1.json
  def update
    respond_to do |format|
      if @motorista.update(motorista_params)
        format.html { redirect_to @motorista, notice: 'Motorista was successfully updated.' }
        format.json { render :show, status: :ok, location: @motorista }
      else
        format.html { render :edit }
        format.json { render json: @motorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motorista/1
  # DELETE /motorista/1.json
  def destroy
    @motorista.destroy
    respond_to do |format|
      format.html { redirect_to motorista_index_url, notice: 'Motorista was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorista
      @motorista = Motorista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motorista_params
      params.require(:motorista).permit(:cpf, :nome, :numeroDeHoras, :bancoDeHoras, :telefone)
    end
end
