class Api::CustomizationsController < Api::ApiController
  before_action :set_customization, only: [:show, :edit, :update, :destroy]

  def index
    render json: { customizations: Customization.all }
  end

  # GET /customizations/1
  # GET /customizations/1.json
  def show
    render json: { customization: @customization }
  end

  # POST /customizations
  # POST /customizations.json
  def create
    @customization = Customization.new(customization_params)

    if @customization.save
      render json: { customization: @customization }, status: :created
    else
      render json: @customization.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customizations/1
  # PATCH/PUT /customizations/1.json
  def update
    if @customization.update(customization_params)
      render json: { customization: @customization }, status: :ok
    else
      render json: @customization.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customizations/1
  # DELETE /customizations/1.json
  def destroy
    @customization.destroy
    head :no_content
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_customization
      @customization = Customization.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customization_params
      params.require(:customization).permit(:settings)
    end

end
