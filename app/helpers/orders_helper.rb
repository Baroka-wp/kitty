module OrdersHelper
  def statuts_for_select
    Order.statuses.map { |b| [format_statut(b[0]), b[0]] }
  end

  private

  def format_statut(order)
    order.gsub('_', ' ').capitalize
  end
end
