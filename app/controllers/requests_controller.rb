class RequestsController < ApplicationController
  before_action :set_request, only: %i[ show edit update destroy approve]

  # GET /requests or /requests.json
  def index
    if current_user.nil?
      redirect_to login_url
      return
    end
  end

  # GET /requests/1 or /requests/1.json
  def show
  end

  # GET /requests/new
  def new
    @request = Request.new
  end

  # GET /requests/1/edit
  def edit
  end

  def completed
    @sent_requests = Request.where(sender_id: current_user.id, status: "completed")
    @received_requests = Request.where(requester_id: current_user.id, status: "completed")
  end

  def pending
    @sent_requests = Request.where(sender_id: current_user.id, status: "pending")
    @received_requests = Request.where(requester_id: current_user.id, status: "pending")
    respond_to do |format|
      format.html
    end
  end

  def approve
    @request.status = "completed" 
    @request.save
    # params[:sender_id] = @request.requester_id.to_s
    # params[:receiver_id] = @request.sender_id.to_s
    # params[:transaction_amount] = @request.amount.to_s
    redirect_to create_transaction_path(transaction: {sender_id: @request.sender_id.to_s, receiver_id: User.find(@request.requester_id).account.account_no.to_s, transaction_amount: @request.amount.to_s})    
  end

  # POST /requests or /requests.json
  def create
    @request = Request.new(request_params)
    @request.requester_id = current_user.id
    @request.sender_id = (User.find_by phno: request_params[:sender_phno]).id
    @request.status = "pending"
    
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: "Request was successfully created." }
        format.json { render :show, status: :created, location: @request }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requests/1 or /requests/1.json
  def update
    respond_to do |format|
      if @request.update(request_params)
        format.html { redirect_to @request, notice: "Request was successfully updated." }
        format.json { render :show, status: :ok, location: @request }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requests/1 or /requests/1.json
  def destroy
    @request.destroy
    respond_to do |format|
      format.html { redirect_to requests_url, notice: "Request was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_request
      @request = Request.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def request_params
      params.require(:request).permit(:requester_id, :sender_id, :amount, :message, :status, :sender_phno)
    end
end
