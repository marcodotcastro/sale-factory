class GatewayPagamento

  def initialize(pagamento)
    @pagamento = pagamento
  end

  def criar_assinatura
    industria = @pagamento.usuario.industria

    #TODO: Adicionar id_gateway
    plan = PagarMe::Plan.find_by_id("427562")

    subscription = PagarMe::Subscription.new(
        {
            payment_method: 'credit_card',
            card_number: "5208607641206488",
            card_holder_name: industria.descricao,
            card_expiration_month: "03",
            card_expiration_year: "20",
            card_cvv: "879",
            postback_url: "http://test.com/postback",
            customer: {
                name: industria.descricao,
                email: industria.email,
                type: 'individual',
                external_id: "#{industria.id}",
                country: 'br',
                document_number: industria.cnpj,
                address: {
                    zipcode: industria.cep,
                    neighborhood: industria.cidade.descricao,
                    street: industria.endereco,
                    street_number: "0"
                },
                phone: {
                    ddd: industria.telefone[0, 2],
                    number: industria.telefone[2, 10]
                }
            }
        }

    )

    subscription.plan = plan

    subscription.create
  end

  def atualizar_assinatura
    #TODO: Adicionar id_gateway
    subscription = PagarMe::Subscription.find_by_id("421112")

    #TODO: Adicionar id_gateway
    plan = PagarMe::Plan.find_by_id("427635")

    subscription.plan = plan

    subscription.save
  end

  def cancelar_assinatura
    #TODO: Adicionar id_gateway
    subscription = PagarMe::Subscription.find_by_id("421110")

    subscription.cancel
  end

end

