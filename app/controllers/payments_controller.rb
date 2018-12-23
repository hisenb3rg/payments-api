# Implements jsonapi endpoint for serving payment resources
class PaymentsController < ApplicationController
  NOT_FOUND = 'Resource Not Found'

  before_action :enforce_jsonapi_accept_header

  # GET /payments
  def index
    render json: jsonapi(Payment.all), status: :ok
  end

  # GET /payments/:id
  def show
    render json: jsonapi(Payment.find(params[:id])), status: :ok
  rescue ActiveRecord::RecordNotFound => e
    render json: { errors: [error(NOT_FOUND, e.message)] }, status: :not_found
  end

  private

  def jsonapi(*args)
    PaymentSerializer.new(*args).serializable_hash
  end

  def error(type, detail)
    { type: type, detail: detail }
  end

  def enforce_jsonapi_accept_header
    unless request.headers['HTTP_ACCEPT'].try(:start_with?, 'application/vnd.api+json')
      render nothing: true, status: :unsupported_media_type
    end
  end
end
