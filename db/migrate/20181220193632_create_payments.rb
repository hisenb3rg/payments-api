class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments, id: :uuid do |t|
      t.string :amount, null: false
      t.string :currency, null: false
      t.string :end_to_end_reference
      t.string :numeric_reference
      t.string :payment_id
      t.string :payment_purpose
      t.string :payment_scheme
      t.string :payment_type
      t.string :processing_date
      t.string :reference
      t.string :scheme_payment_type
      t.string :scheme_payment_sub_type

      t.jsonb :beneficiary_party
      t.jsonb :debtor_party
      t.jsonb :sponsor_party
      t.jsonb :charges_information
      t.jsonb :fx

      t.timestamps
    end
  end
end
