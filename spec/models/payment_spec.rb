require 'rails_helper'

RSpec.describe Payment, type: :model do
  subject { build(:payment) }

  describe 'basic fields' do
    it 'generates uuid for primary key' do
      subject.save!

      expect(subject.id).to match(/^[a-z0-9\-]{36}$/)
    end

    it 'provides getters and setters' do
      subject.amount = '100.99'
      subject.currency = 'AUD'
      subject.end_to_end_reference = 'Drinks'
      subject.numeric_reference = '123456'
      subject.payment_id = '1234567890'
      subject.payment_purpose = 'Pay for drinks'
      subject.payment_scheme = 'FFF'
      subject.payment_type = 'Debit'
      subject.processing_date = '2017-01-18'
      subject.reference = 'Payment for drinks'
      subject.scheme_payment_sub_type = 'Banking'
      subject.scheme_payment_type = 'Payment'
      subject.save!

      expect(subject.amount).to eq('100.99')
      expect(subject.currency).to eq('AUD')
      expect(subject.end_to_end_reference).to eq('Drinks')
      expect(subject.numeric_reference).to eq('123456')
      expect(subject.payment_id).to eq('1234567890')
      expect(subject.payment_purpose).to eq('Pay for drinks')
      expect(subject.payment_scheme).to eq('FFF')
      expect(subject.payment_type).to eq('Debit')
      expect(subject.processing_date).to eq('2017-01-18')
      expect(subject.reference).to eq('Payment for drinks')
      expect(subject.scheme_payment_sub_type).to eq('Banking')
      expect(subject.scheme_payment_type).to eq('Payment')
    end
  end

  describe 'complex fields' do
    let(:beneficiary) { { account_name: 'John Doe', account_number: '123456' } }
    let(:debtor) { { account_name: 'Jane Doe', account_number: '678900' } }
    let(:sponsor) { { account_number: '123456' } }
    let(:charges) { { bearer_code: 'SHAR', sender_charges: [{amount: '5.00'}, {amount: '15.00'}] } }
    let(:fx) { { account_name: 'John Doe', account_number: '123456' } }

    it 'provides getters and setters' do
      subject.beneficiary_party = beneficiary
      subject.debtor_party = debtor
      subject.sponsor_party = sponsor
      subject.charges_information = charges
      subject.fx = fx
      subject.save!

      expect(subject.beneficiary_party).to eq(beneficiary.deep_stringify_keys)
      expect(subject.debtor_party).to eq(debtor.deep_stringify_keys)
      expect(subject.sponsor_party).to eq(sponsor.deep_stringify_keys)
      expect(subject.charges_information).to eq(charges.deep_stringify_keys)
      expect(subject.fx).to eq(fx.deep_stringify_keys)
    end
  end

  describe 'validation' do
    before { expect(subject).to be_valid }

    describe '#amount' do
      it 'validates presence' do
        subject.amount = nil

        expect(subject).not_to be_valid
        expect(subject.errors[:amount]).to include("can't be blank")
      end

      it 'validates it is correctly formatted number' do
        subject.amount = '123XYZ32.23'

        expect(subject).not_to be_valid
        expect(subject.errors[:amount]).to include('is not a number')
      end
    end

    describe '#currency' do
      it 'validates presence' do
        subject.currency = nil

        expect(subject).not_to be_valid
        expect(subject.errors[:currency]).to include("can't be blank")
      end

      it 'validates it is in ISO currency format' do
        subject.currency = 'gb'

        expect(subject).not_to be_valid
        expect(subject.errors[:currency]).to include('is not in ISO currency format')
      end
    end

    describe '#version' do
      it 'validates presence' do
        subject.version = nil

        expect(subject).not_to be_valid
        expect(subject.errors[:version]).to include("can't be blank")
      end
    end

    describe '#organisation_id' do
      it 'validates presence' do
        subject.organisation_id = nil

        expect(subject).not_to be_valid
        expect(subject.errors[:organisation_id]).to include("can't be blank")
      end
    end
  end
end
