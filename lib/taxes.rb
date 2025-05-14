class Taxes
  def initialize(item)
    @item = item
    @gross_total = item[:price]
    @tax = 0
  end

  def calculate_taxes
    return 0 if item_exempt? && !@item[:imported]

    taxes_for_all_goods unless item_exempt?
    tax_for_imported_products if @item[:imported]
    CustomRound.round_up_by005(@tax)
  end

  private

  def taxes_for_all_goods
    @tax = CustomRound.round_up_by005(@gross_total * 0.1)
  end

  def tax_for_imported_products
    @tax += CustomRound.round_up_by005(@gross_total * 0.05)
    @tax = CustomRound.round_up_by005(@tax)
  end

  def item_exempt?
    %i[books food medical].include?(@item[:category])
  end
end
