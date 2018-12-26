# Model representing persistable payment record
class Payment < ApplicationRecord
  BASIC_ATTRS = [
    :amount, :currency, :end_to_end_reference, :numeric_reference,
    :payment_id, :payment_purpose, :payment_scheme, :payment_type,
    :processing_date, :reference, :scheme_payment_type, :scheme_payment_sub_type,
  ]

  PARTY_ATTRS = [
    :account_name, :account_number, :account_number_code, :account_type,
    :name, :address, :bank_id, :bank_id_code,
  ]

  COMPLEX_ATTRS = {
    beneficiary_party: PARTY_ATTRS,
    debtor_party: PARTY_ATTRS,
    sponsor_party: %i(account_number bank_id bank_id_code),
    charges_information: [
      :bearer_code, :receiver_charges_amount, :receiver_charges_currency,
      { sender_charges: %i(amount currency) }
    ],
    fx: %i(contract_reference exchange_rate original_amount original_currency),
  }

  validates :amount, presence: true, numericality: true
  validates :currency, presence: true,
    format: { with: /[A-Z]{3}/, message: 'is not in ISO currency format' }
end
