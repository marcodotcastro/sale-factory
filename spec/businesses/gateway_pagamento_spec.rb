require 'rails_helper'

RSpec.describe "Gateway Pagamento" do

  before(:all) do
    PagarMe.api_key = 'ak_test_xBv7ECgxSKfpuFOuMY1LnNADwceHfo'
    PagarMe.encryption_key = 'ek_test_UCr02l6LB5o6HXuqNOi7wYD2DT7Q2p'
  end

  context "integração" do

    it "criar cliente" do
      customer = PagarMe::Customer.create(
          name: 'Morpheus Fishburne',
          email: 'mopheus@nabucodonozor.com',
          type: 'individual',
          external_id: "#3311",
          country: 'br',
          birthday: "1965-01-01",
          documents: [
              {type: "cpf", number: "86870624194"}
          ],
          phone_numbers: ["+5511999998888", "+5511888889999"]
      )
    end

    it "criar plano" do
      PagarMe::Plan.new(
          amount: 4990,
          days: 30,
          name: 'Gold Plan'
      ).create
    end

    it "pagar com cartão de credito" do
      transaction = PagarMe::Transaction.new(
          {
              :amount => 1000,
              :card_number => '4901720080344448',
              :card_holder_name => 'Jose da Silva',
              :card_expiration_month => '10',
              :card_expiration_year => "20",
              :card_cvv => '314',
              :customer => {
                  :name => "John Appleseed",
                  :document_number => "92545278157",
                  :email => "jappleseed@apple.com",
                  :address => {
                      :street => "Rua Dr. Geraldo Campos Moreira",
                      :neighborhood => "Cidade Monções",
                      :zipcode => "04571020",
                      :street_number => "240"
                  },
                  :phone => {
                      :ddd => "11",
                      :number => "15510101"
                  }
              }
          }

      )

      transaction.charge
    end

    it "pagar com boleto" do
      transaction = PagarMe::Transaction.new(
          amount: 100,
          payment_method: "boleto",
          postback_url: "http://requestb.in/pkt7pgpk",
          customer: {
              name: "Aardvark Silva",
              document_number: "18152564000105",
          }
      )
      transaction.charge
    end

  end

end
