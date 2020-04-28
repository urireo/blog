class CostumersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
  before_action :set_costumer, only: [:show, :edit, :update, :destroy]
  layout 'costumer_layout' #this will check for flash alerts
  # GET /costumers
  # GET /costumers.json
  def index
    @costumers = Costumer.all
  end

  # GET /costumers/1
  # GET /costumers/1.json
  def show
  end

  # GET /costumers/new
  def new
    @costumer = Costumer.new
  end

  # GET /costumers/1/edit
  def edit
  end

  # POST /costumers
  # POST /costumers.json
  def create
    @costumer = Costumer.new(costumer_params)
    if @costumer.save #if this returns not nill values, then it is success
      flash.notice = "The customer record was created duccessfully."
      redirect_to @costumer
    else
      flash.now.alert = @costumer.errors.full_messages.to_sentence
      render :new
    end

  #  @costumer = Costumer.new(costumer_params)

  #  respond_to do |format|
  #    if @costumer.save
  #      format.html { redirect_to @costumer, notice: 'Costumer was successfully created.' }
  #      format.json { render :show, status: :created, location: @costumer }
  #    else
  #      format.html { render :new }
  #      format.json { render json: @costumer.errors, status: :unprocessable_entity }
  #    end
  #  end
  end

  # PATCH/PUT /costumers/1
  # PATCH/PUT /costumers/1.json
  def update
    if @costumer.update(costumer_params) #if this returns not nill values, then it is success
      flash.notice = "The customer record was created successfully."
      redirect_to @costumer
    else
      flash.now.alert =@costumer.errors.full_messages.to_sentence
      render :edit
    end

    # respond_to do |format|
    #   if @costumer.update(costumer_params)
    #     format.html { redirect_to @costumer, notice: 'Costumer was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @costumer }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @costumer.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /costumers/1
  # DELETE /costumers/1.json
  def destroy
    @costumer.destroy
    respond_to do |format|
      format.html { redirect_to costumers_url, notice: 'Costumer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costumer
      @costumer = Costumer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def costumer_params
      params.require(:costumer).permit(:first_name, :last_name, :phone, :email)
    end
    def catch_not_found(e)
      Rails.logger.debug("We had a not found exception.")
      flash.alert = e.to_s
      redirect_to costumers_path
    end

end
