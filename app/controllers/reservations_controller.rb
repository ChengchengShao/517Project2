class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  # GET /reservations
  # GET /reservations.json
  def index
    @user=User.all
    if logged_in?
      if current_user.admin?
        @reservations = Reservation.all
      else
        @reservations=Reservation.where(:user_id => current_user.id)
      end
    else
      @reservations=[]
    end
  end

  # GET /reservations/1
  # GET /reservations/1.json
  def show
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
    car = Car.find(params[:car_id])
    @reservation.car_id = car.id
  end

  # GET /reservations/1/edit
  def editcreated_at
  end

  # POST /reservations
  # POST /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)
    car = Car.find(@reservation.car_id)
    #change car status to reserved
    @reservation.reserve_time = Time.zone.now
    # period = @reservation.return_time
    @reservation.return_time = @reservation.checkout_time+Integer(reservation_params[:return_time]).hours

    if current_user != nil
      @reservation.user_id = current_user.id
    end
    @reservation.status = 'reserved'
    respond_to do |format|
      if @reservation.save
        car.update_attribute('status', 'reserved')
        format.html {redirect_to @reservation, notice: 'Reservation was successfully created.'}
        format.json {render :show, status: :created, location: @reservation}
      else
        format.html {render :new}
        format.json {render json: @reservation.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /reservations/1 added by scc 20170917
  # PATCH/PUT /reservations/1.json
  def confirm
    respond_to do |format|
      if @reservation.update(reservation_params)
        printf (reservation_params[:id])
        format.html {redirect_to @reservation, notice: 'Reservation was successfully updated.'}
        format.json {render :show, status: :ok, location: @reservation}
      else
        format.html {render :edit}
        format.json {render json: @reservation.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /reservations/1
  # PATCH/PUT /reservations/1.json
  def update
    #added by scc 20170917  +Integer(reservation_params[:return_time]).hours


    respond_to do |format|
      if @reservation.update(reservation_params)

        @reservation.update_attribute('return_time', @reservation.checkout_time+Integer(reservation_params[:return_time]).hours)

        format.html {redirect_to @reservation, notice: 'Reservation was successfully updated.'}
        format.json {render :show, status: :ok, location: @reservation}
      else
        format.html {render :edit}
        format.json {render json: @reservation.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /reservations/1
  # DELETE /reservations/1.json
  def destroy
    session[:reservation_id] = nil
    respond_to do |format|
      if @reservation.destroy
        #@reservation = current_reservation
        car = Car.find_by_id(@reservation.car_id)
        #free the car to available
        if !car.nil?
          car.update_attribute('status', 'available')
        end
        
        format.html {redirect_to store_url, notice: 'Reservation is canceled.'}
        format.json {head :no_content}
      else
        format.html {redirect_to reservations_url, notice: 'There are related orders, please destroy order first.'}
        format.json {render json: @reservation.errors, status: :unprocessable_entity}
      end
    end


  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  #def reservation_params
  #params.fetch(:reservation, {})
  #end


  def reservation_params
    params.require(:reservation).permit(:user_id, :car_id, :checkout_time, :return_time, :name, :tel, :email, :address)
  end
end
