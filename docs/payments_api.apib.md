FORMAT: 1A

# Payments API

This is a simple API providing actions for managing payment resources.

It follows [v1.0 JSON:API Specification](https://jsonapi.org/format/).

Currently it is implemented as a public API and requries no authentication or authorization.


## Payments [/payments]

Endpoint for managing payment resources.


### List all payments [GET /payments]
Fetch all payment resources. Filtering or pagination is currently not supported.

+ Request
        
    + Header
        
            Accept: application/vnd.api+json

+ Response 200

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body

            {
                "data": [
                    {
                        "id": "839eeda8-1a50-4432-9d56-64f24d9414dd",
                        "type": "Payment",
                        "attributes": {
                            "amount": "100.21",
                            "currency": "GBP",
                            "end_to_end_reference": "Wil piano Jan",
                            "numeric_reference": "1002001",
                            "payment_id": "123456789012345678",
                            "payment_purpose": "Paying for goods/services",
                            "payment_scheme": "FPS",
                            "payment_type": "Credit",
                            "processing_date": "2017-01-18",
                            "reference": "Payment for Em's piano lessons",
                            "scheme_payment_type": "ImmediatePayment",
                            "scheme_payment_sub_type": "InternetBanking",
                            "version": 0,
                            "organisation_id": "743d5b63-8e6f-432e-a8fa-c5d8d2ee5fcb",
                            "beneficiary_party": {
                                "name": "Wilfred Jeremiah Owens",
                                "address": "1 The Beneficiary Localtown SE2",
                                "bank_id": "403000",
                                "account_name": "W Owens",
                                "account_type": 0,
                                "bank_id_code": "GBDSC",
                                "account_number": "31926819",
                                "account_number_code": "BBAN"
                            },
                            "debtor_party": {
                                "name": "Emelia Jane Brown",
                                "address": "10 Debtor Crescent Sourcetown NE1",
                                "bank_id": "203301",
                                "account_name": "EJ Brown Black",
                                "bank_id_code": "GBDSC",
                                "account_number": "GB29XABC10161234567801",
                                "account_number_code": "IBAN"
                            },
                            "sponsor_party": {
                                "bank_id": "123123",
                                "bank_id_code": "GBDSC",
                                "account_number": "56781234"
                            },
                            "charges_information": {
                                "bearer_code": "SHAR",
                                "sender_charges": [
                                    {
                                        "amount": "5.00",
                                        "currency": "GBP"
                                    },
                                    {
                                        "amount": "10.00",
                                        "currency": "USD"
                                    }
                                ],
                                "receiver_charges_amount": "1.00",
                                "receiver_charges_currency": "USD"
                            },
                            "fx": {
                                "exchange_rate": "2.00000",
                                "original_amount": "200.42",
                                "original_currency": "USD",
                                "contract_reference": "FX123"
                            }
                        },
                        "links": {
                            "self": "http://localhost:3000/payments/839eeda8-1a50-4432-9d56-64f24d9414dd"
                        }
                    },
                    {
                        "id": "40c8f561-e70f-4922-b830-00be2434a9f6",
                        "type": "Payment",
                        "attributes": {
                            "amount": "100.21",
                            "currency": "GBP",
                            "end_to_end_reference": "Wil piano Jan",
                            "numeric_reference": "1002001",
                            "payment_id": "123456789012345678",
                            "payment_purpose": "Paying for goods/services",
                            "payment_scheme": "FPS",
                            "payment_type": "Credit",
                            "processing_date": "2017-01-18",
                            "reference": "Payment for Em's piano lessons",
                            "scheme_payment_type": "ImmediatePayment",
                            "scheme_payment_sub_type": "InternetBanking",
                            "version": 0,
                            "organisation_id": "743d5b63-8e6f-432e-a8fa-c5d8d2ee5fcb",
                            "beneficiary_party": {
                                "name": "Wilfred Jeremiah Owens",
                                "address": "1 The Beneficiary Localtown SE2",
                                "bank_id": "403000",
                                "account_name": "W Owens",
                                "account_type": 0,
                                "bank_id_code": "GBDSC",
                                "account_number": "31926819",
                                "account_number_code": "BBAN"
                            },
                            "debtor_party": {
                                "name": "Emelia Jane Brown",
                                "address": "10 Debtor Crescent Sourcetown NE1",
                                "bank_id": "203301",
                                "account_name": "EJ Brown Black",
                                "bank_id_code": "GBDSC",
                                "account_number": "GB29XABC10161234567801",
                                "account_number_code": "IBAN"
                            },
                            "sponsor_party": {
                                "bank_id": "123123",
                                "bank_id_code": "GBDSC",
                                "account_number": "56781234"
                            },
                            "charges_information": {
                                "bearer_code": "SHAR",
                                "sender_charges": [
                                    {
                                        "amount": "5.00",
                                        "currency": "GBP"
                                    },
                                    {
                                        "amount": "10.00",
                                        "currency": "USD"
                                    }
                                ],
                                "receiver_charges_amount": "1.00",
                                "receiver_charges_currency": "USD"
                            },
                            "fx": {
                                "exchange_rate": "2.00000",
                                "original_amount": "200.42",
                                "original_currency": "USD",
                                "contract_reference": "FX123"
                            }
                        },
                        "links": {
                            "self": "http://localhost:3000/payments/40c8f561-e70f-4922-b830-00be2434a9f6"
                        }
                    }
                ]
            }

### Fetch existing payment [GET /payments/{id}]
Fetch an existing payment resource by id.

+ Parameters
    + id (uuid) - ID of payment resource
    
+ Request
        
    + Header
        
            Accept: application/vnd.api+json
            
+ Response 200

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "data": {
                    "id": "839eeda8-1a50-4432-9d56-64f24d9414dd",
                    "type": "Payment",
                    "attributes": {
                        "amount": "100.21",
                        "currency": "GBP",
                        "end_to_end_reference": "Wil piano Jan",
                        "numeric_reference": "1002001",
                        "payment_id": "123456789012345678",
                        "payment_purpose": "Paying for goods/services",
                        "payment_scheme": "FPS",
                        "payment_type": "Credit",
                        "processing_date": "2017-01-18",
                        "reference": "Payment for Em's piano lessons",
                        "scheme_payment_type": "ImmediatePayment",
                        "scheme_payment_sub_type": "InternetBanking",
                        "version": 0,
                        "organisation_id": "743d5b63-8e6f-432e-a8fa-c5d8d2ee5fcb",
                        "beneficiary_party": {
                            "name": "Wilfred Jeremiah Owens",
                            "address": "1 The Beneficiary Localtown SE2",
                            "bank_id": "403000",
                            "account_name": "W Owens",
                            "account_type": 0,
                            "bank_id_code": "GBDSC",
                            "account_number": "31926819",
                            "account_number_code": "BBAN"
                        },
                        "debtor_party": {
                            "name": "Emelia Jane Brown",
                            "address": "10 Debtor Crescent Sourcetown NE1",
                            "bank_id": "203301",
                            "account_name": "EJ Brown Black",
                            "bank_id_code": "GBDSC",
                            "account_number": "GB29XABC10161234567801",
                            "account_number_code": "IBAN"
                        },
                        "sponsor_party": {
                            "bank_id": "123123",
                            "bank_id_code": "GBDSC",
                            "account_number": "56781234"
                        },
                        "charges_information": {
                            "bearer_code": "SHAR",
                            "sender_charges": [
                                {
                                    "amount": "5.00",
                                    "currency": "GBP"
                                },
                                {
                                    "amount": "10.00",
                                    "currency": "USD"
                                }
                            ],
                            "receiver_charges_amount": "1.00",
                            "receiver_charges_currency": "USD"
                        },
                        "fx": {
                            "exchange_rate": "2.00000",
                            "original_amount": "200.42",
                            "original_currency": "USD",
                            "contract_reference": "FX123"
                        }
                    },
                    "links": {
                        "self": "http://localhost:3000/payments/839eeda8-1a50-4432-9d56-64f24d9414dd"
                    }
                }
            }    
            
+ Response 404

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "errors": [
                    {
                        "type": "Resource Not Found",
                        "detail": "Couldn't find Payment with 'id'=839eeda8-1a50-4432-9d56-64f24d9414"
                    }
                ]
            }
            


        
### Creating new payment [POST /payments]
Create a new payment resource.

+ Request
        
    + Header
        
            Accept: application/vnd.api+json
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "data": {
                    "type": "Payment",
                    "attributes": {
                        "amount": "999.99",
                        "beneficiary_party": {
                            "account_name": "W Owens",
                            "account_number": "31926819",
                            "account_number_code": "BBAN",
                            "account_type": 0,
                            "address": "1 The Beneficiary Localtown SE2",
                            "bank_id": "403000",
                            "bank_id_code": "GBDSC",
                            "name": "Wilfred Jeremiah Owens"
                        },
                        "charges_information": {
                            "bearer_code": "SHAR",
                            "sender_charges": [
                                {
                                    "amount": "5.00",
                                    "currency": "GBP"
                                },
                                {
                                    "amount": "10.00",
                                    "currency": "USD"
                                }
                            ],
                            "receiver_charges_amount": "1.00",
                            "receiver_charges_currency": "USD"
                        },
                        "currency": "GBP",
                        "debtor_party": {
                            "account_name": "EJ Brown Black",
                            "account_number": "GB29XABC10161234567801",
                            "account_number_code": "IBAN",
                            "address": "10 Debtor Crescent Sourcetown NE1",
                            "bank_id": "203301",
                            "bank_id_code": "GBDSC",
                            "name": "Emelia Jane Brown"
                        },
                        "end_to_end_reference": "Wil piano Jan",
                        "fx": {
                            "contract_reference": "FX123",
                            "exchange_rate": "2.00000",
                            "original_amount": "200.42",
                            "original_currency": "USD"
                        },
                        "numeric_reference": "1002001",
                        "payment_id": "123456789012345678",
                        "payment_purpose": "Paying for goods/services",
                        "payment_scheme": "FPS",
                        "payment_type": "Credit",
                        "processing_date": "2017-01-18",
                        "reference": "Payment for Em's piano lessons",
                        "scheme_payment_sub_type": "InternetBanking",
                        "scheme_payment_type": "ImmediatePayment",
                        "sponsor_party": {
                            "account_number": "56781234",
                            "bank_id": "123123",
                            "bank_id_code": "GBDSC"
                        },
                        "version": 0,
                        "organisation_id": "743d5b63-8e6f-432e-a8fa-c5d8d2ee5fcb"
                    }
                }
            }

+ Response 201

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body

            {
                "data": {
                    "id": "69deaf47-570f-4442-96f8-7e1d1dfe4f2f",
                    "type": "Payment",
                    "attributes": {
                        "amount": "999.99",
                        "currency": "GBP",
                        "end_to_end_reference": "Wil piano Jan",
                        "numeric_reference": "1002001",
                        "payment_id": "123456789012345678",
                        "payment_purpose": "Paying for goods/services",
                        "payment_scheme": "FPS",
                        "payment_type": "Credit",
                        "processing_date": "2017-01-18",
                        "reference": "Payment for Em's piano lessons",
                        "scheme_payment_type": "ImmediatePayment",
                        "scheme_payment_sub_type": "InternetBanking",
                        "version": 0,
                        "organisation_id": "743d5b63-8e6f-432e-a8fa-c5d8d2ee5fcb",
                        "beneficiary_party": {
                            "account_name": "W Owens",
                            "account_number": "31926819",
                            "account_number_code": "BBAN",
                            "account_type": 0,
                            "name": "Wilfred Jeremiah Owens",
                            "address": "1 The Beneficiary Localtown SE2",
                            "bank_id": "403000",
                            "bank_id_code": "GBDSC"
                        },
                        "debtor_party": {
                            "account_name": "EJ Brown Black",
                            "account_number": "GB29XABC10161234567801",
                            "account_number_code": "IBAN",
                            "name": "Emelia Jane Brown",
                            "address": "10 Debtor Crescent Sourcetown NE1",
                            "bank_id": "203301",
                            "bank_id_code": "GBDSC"
                        },
                        "sponsor_party": {
                            "account_number": "56781234",
                            "bank_id": "123123",
                            "bank_id_code": "GBDSC"
                        },
                        "charges_information": {
                            "bearer_code": "SHAR",
                            "receiver_charges_amount": "1.00",
                            "receiver_charges_currency": "USD",
                            "sender_charges": [
                                {
                                    "amount": "5.00",
                                    "currency": "GBP"
                                },
                                {
                                    "amount": "10.00",
                                    "currency": "USD"
                                }
                            ]
                        },
                        "fx": {
                            "contract_reference": "FX123",
                            "exchange_rate": "2.00000",
                            "original_amount": "200.42",
                            "original_currency": "USD"
                        }
                    },
                    "links": {
                        "self": "http://localhost:3000/payments/69deaf47-570f-4442-96f8-7e1d1dfe4f2f"
                    }
                }
            }

+ Response 422

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "errors": [
                    {
                        "type": "Resource Invalid",
                        "detail": "Validation failed: Amount can't be blank, Amount is not a number"
                    }
                ]
            }
            

### Updating payment [PATCH /payments/{id}]
Update existing payment resource.

+ Parameters
    + id (uuid) - ID of payment resource
    
+ Request
        
    + Header
        
            Accept: application/vnd.api+json
            Content-Type: application/vnd.api+json
            
    + Body

            {
                "data": {
                    "type": "Payment",
                    "attributes": {
                        "amount": "99999.99"
                    }
                }
            }
            
+ Response 200

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "data": {
                    "id": "839eeda8-1a50-4432-9d56-64f24d9414dd",
                    "type": "Payment",
                    "attributes": {
                        "amount": "99999.99",
                        "currency": "GBP",
                        "end_to_end_reference": "Wil piano Jan",
                        "numeric_reference": "1002001",
                        "payment_id": "123456789012345678",
                        "payment_purpose": "Paying for goods/services",
                        "payment_scheme": "FPS",
                        "payment_type": "Credit",
                        "processing_date": "2017-01-18",
                        "reference": "Payment for Em's piano lessons",
                        "scheme_payment_type": "ImmediatePayment",
                        "scheme_payment_sub_type": "InternetBanking",
                        "version": 0,
                        "organisation_id": "743d5b63-8e6f-432e-a8fa-c5d8d2ee5fcb",
                        "beneficiary_party": {
                            "name": "Wilfred Jeremiah Owens",
                            "address": "1 The Beneficiary Localtown SE2",
                            "bank_id": "403000",
                            "account_name": "W Owens",
                            "account_type": 0,
                            "bank_id_code": "GBDSC",
                            "account_number": "31926819",
                            "account_number_code": "BBAN"
                        },
                        "debtor_party": {
                            "name": "Emelia Jane Brown",
                            "address": "10 Debtor Crescent Sourcetown NE1",
                            "bank_id": "203301",
                            "account_name": "EJ Brown Black",
                            "bank_id_code": "GBDSC",
                            "account_number": "GB29XABC10161234567801",
                            "account_number_code": "IBAN"
                        },
                        "sponsor_party": {
                            "bank_id": "123123",
                            "bank_id_code": "GBDSC",
                            "account_number": "56781234"
                        },
                        "charges_information": {
                            "bearer_code": "SHAR",
                            "sender_charges": [
                                {
                                    "amount": "5.00",
                                    "currency": "GBP"
                                },
                                {
                                    "amount": "10.00",
                                    "currency": "USD"
                                }
                            ],
                            "receiver_charges_amount": "1.00",
                            "receiver_charges_currency": "USD"
                        },
                        "fx": {
                            "exchange_rate": "2.00000",
                            "original_amount": "200.42",
                            "original_currency": "USD",
                            "contract_reference": "FX123"
                        }
                    },
                    "links": {
                        "self": "http://localhost:3000/payments/839eeda8-1a50-4432-9d56-64f24d9414dd"
                    }
                }
            }
            
+ Response 404

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "errors": [
                    {
                        "type": "Resource Not Found",
                        "detail": "Couldn't find Payment with 'id'=839eeda8-1a50-4432-9d56-64f24d9414"
                    }
                ]
            }

+ Response 422

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "errors": [
                    {
                        "type": "Resource Invalid",
                        "detail": "Validation failed: Amount can't be blank, Amount is not a number"
                    }
                ]
            }
            

### Deleting payment [DELETE /payments/{id}]
Delete existing payment resource.

+ Parameters
    + id (uuid) - ID of payment resource
    
+ Request
        
    + Header
        
            Accept: application/vnd.api+json

+ Response 204

+ Response 404

    + Header
        
            Content-Type: application/vnd.api+json
            
    + Body
    
            {
                "errors": [
                    {
                        "type": "Resource Not Found",
                        "detail": "Couldn't find Payment with 'id'=839eeda8-1a50-4432-9d56-64f24d9414"
                    }
                ]
            }
