require 'rails_helper'

RSpec.describe Payment do
  let(:payment) { create(:payment) }

  subject { PaymentSerializer.new(payment) }

  describe 'payment resource as serializable hash' do
    let(:result) { JSON.parse(subject.serialized_json) }

    it 'has jsonapi structure' do
      expect(result['data']).to be_present
      expect(result['data'].keys).to include(*%w(id type attributes links))
    end

    it 'includes type' do
      expect(result.dig('data', 'type')).to eq('Payment')
    end

    it 'includes id' do
      expect(result.dig('data', 'id')).to eq(payment.id)
    end

    it 'includes basic attributes' do
      attrs = result.dig('data', 'attributes')
      expect(attrs['amount']).to eq(payment.amount)
      expect(attrs['currency']).to eq(payment.currency)
      expect(attrs['end_to_end_reference']).to eq(payment.end_to_end_reference)
      expect(attrs['numeric_reference']).to eq(payment.numeric_reference)
      expect(attrs['payment_id']).to eq(payment.payment_id)
      expect(attrs['payment_purpose']).to eq(payment.payment_purpose)
      expect(attrs['payment_scheme']).to eq(payment.payment_scheme)
      expect(attrs['payment_type']).to eq(payment.payment_type)
      expect(attrs['processing_date']).to eq(payment.processing_date)
      expect(attrs['reference']).to eq(payment.reference)
      expect(attrs['scheme_payment_sub_type']).to eq(payment.scheme_payment_sub_type)
      expect(attrs['scheme_payment_type']).to eq(payment.scheme_payment_type)
    end

    it 'includes complex attributes' do
      attrs = result.dig('data', 'attributes')
      expect(attrs['beneficiary_party']).to eq(payment.beneficiary_party)
      expect(attrs['debtor_party']).to eq(payment.debtor_party)
      expect(attrs['sponsor_party']).to eq(payment.sponsor_party)
      expect(attrs['charges_information']).to eq(payment.charges_information)
      expect(attrs['fx']).to eq(payment.fx)
    end

    it 'includes self link' do
      expect(result.dig('data', 'links', 'self')).to \
        eq("http://api.form3.test/payments/#{payment.id}")
    end
  end
end
