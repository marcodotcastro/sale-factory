ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc {I18n.t("active_admin.dashboard")}

  content title: proc {I18n.t("active_admin.dashboard")} do

    columns do
      column do
        panel "Assinatura Ativas e Inativas" do
          render partial: 'dashboards/assinatura/por_ativas_e_inativas'
        end
      end
      column do
        panel "Assinatura Planos" do
          render partial: 'dashboards/assinatura/por_plano'
        end
      end
    end

    columns do
      column do
        panel "Solicitação Por Dia" do
          render partial: 'dashboards/solicitacao/por_dia'
        end
      end
      column do
        panel "Solicitação Por Mês" do
          render partial: 'dashboards/solicitacao/por_mes'
        end
      end
      column do
        panel "Solicitação Por Trimestre" do
          render partial: 'dashboards/solicitacao/por_trimestre'
        end
      end
    end

  end
end
