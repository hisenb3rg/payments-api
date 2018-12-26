class PaymentSerializer
  include FastJsonapi::ObjectSerializer

  set_type 'Payment'

  attributes *Payment::BASIC_ATTRS, *Payment::COMPLEX_ATTRS.keys

  link :self do |payment|
    Rails.application.routes.url_helpers.payment_url(payment)
  end
end
