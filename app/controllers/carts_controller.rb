class CartsController < ApplicationController
   skip_before_action :verify_authenticity_token
  before_action :set_cart, only: %i[ show edit update destroy ]

  # GET /carts or /carts.json
  def index
      @carts =Cart.select('carts.*,products.*').joins("JOIN products ON carts.products_id = products.id").where(users_id:1)
    
  end

  # GET /carts/1 or /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    if !session[:user_id]
      redirect_to :controller => 'home', :action => 'login' and return
    end
    # :users_id, :products_id, :quantity_id)
    @cart = Cart.new(users_id:1 ,products_id: params[:products_id], quantity:params[:quantity])
    # @cart.save()
    # render :json=>@cart
    respond_to do |format|
      if @cart.save
      redirect_to :controller => 'carts', :action => 'index'  and return
      else
       redirect_to :controller => 'carts', :action => 'index'  and return
      end
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: "Cart was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:users_id, :products_id, :quantity_id)
    end
end
