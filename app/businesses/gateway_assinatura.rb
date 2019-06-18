class GatewayAssinatura

  def initialize(assinatura)
    @assinatura = assinatura
  end

  def criar_assinatura
    industria = @assinatura.usuario.industria
    plan = PagarMe::Plan.find_by_id(@assinatura.plano.gateway_id)
    subscription = PagarMe::Subscription.new(
        {
            payment_method: 'credit_card',
            card_number: @assinatura.cartao.numero,
            card_holder_name: industria.descricao,
            card_expiration_month: @assinatura.cartao.mes,
            card_expiration_year: @assinatura.cartao.ano,
            card_cvv: @assinatura.cartao.cvv,
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
    subscription = PagarMe::Subscription.find_by_id(@assinatura.gateway_id)
    plan = PagarMe::Plan.find_by_id(@assinatura.plano.gateway_id)
    subscription.plan = plan
    subscription.save
  end

  def cancelar_assinatura
    subscription = PagarMe::Subscription.find_by_id(@assinatura.gateway_id)
    subscription.cancel
  end

end

