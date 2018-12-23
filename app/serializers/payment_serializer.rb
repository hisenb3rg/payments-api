class PaymentSerializer
  include FastJsonapi::ObjectSerializer

  set_type 'Payment'

  attributes :amount, :currency, :end_to_end_reference, :numeric_reference,
    :payment_id, :payment_purpose, :payment_scheme, :payment_type,
    :processing_date, :reference, :scheme_payment_type, :scheme_payment_sub_type,
    :beneficiary_party, :debtor_party, :sponsor_party, :charges_information, :fx

  link :self do |payment|
    Rails.application.routes.url_helpers.payment_url(payment)
  end

end
