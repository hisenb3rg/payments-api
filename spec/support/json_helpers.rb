module JsonHelpers
  def json_response
    @json_response ||= Hashie::Mash.new(JSON.parse(response.body))
  end

  def expect_to_be_jsonapi_payment_resource(json)
    expect(json.type).to eq('Payment')
    expect(json.id).to be_present
    expect(json.links.self).to be_present
    expect(json.attributes).to be_a(Hash)
    expect(json.attributes.keys).to \
      include(*%w(amount beneficiary_party debtor_party sponsor_party fx charges_information))
  end
end
