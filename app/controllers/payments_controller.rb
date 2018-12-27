# Implements jsonapi endpoint for serving payment resources
class PaymentsController < ApplicationController
  NOT_FOUND = 'Resource Not Found'
  RESOURCE_INVALID = 'Resource Invalid'

  before_action :enforce_jsonapi_accept_header

  # GET /payments
  def index
    render json: jsonapi(Payment.all), status: :ok
  end

  # GET /payments/:id
  def show
    render json: jsonapi(Payment.find(params[:id])), status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: jsonapi_error(NOT_FOUND, e.message), status: :not_found
  end

  # POST /payments
  def create
    payment = Payment.new(payment_params)
    payment.save!
    render json: jsonapi(payment), status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: jsonapi_error(RESOURCE_INVALID, e.message), status: :unprocessable_entity
  end

  # PATCH /payments/:id
  def update
    payment = Payment.find(params[:id])
    payment.update!(payment_params)
    render json: jsonapi(payment), status: :ok
  rescue ActiveRecord::RecordInvalid => e
    render json: jsonapi_error(RESOURCE_INVALID, e.message), status: :unprocessable_entity
  rescue ActiveRecord::RecordNotFound => e
    render json: jsonapi_error(NOT_FOUND, e.message), status: :not_found
  end

  # DELETE /payments/:id
  def destroy
    Payment.destroy(params[:id])
    render nothing: true, status: :no_content
  rescue ActiveRecord::RecordNotFound => e
    render json: jsonapi_error(NOT_FOUND, e.message), status: :not_found
  end

  private

  def payment_params
    params.require(:data).require(:attributes)
      .permit(*Payment::BASIC_ATTRS, Payment::COMPLEX_ATTRS)
  end

  def jsonapi(*args)
    PaymentSerializer.new(*args).serializable_hash
  end

  def jsonapi_error(type, detail)
    { errors: [{ type: type, detail: detail }] }
  end

  def enforce_jsonapi_accept_header
    unless request.headers['HTTP_ACCEPT'].try(:start_with?, 'application/vnd.api+json')
      render nothing: true, status: :unsupported_media_type
    end
  end
end
