require_relative './taxes'
require_relative './custom_round'

class Sales
  def initialize(items)
    @items = items
    @receipt = { items: [] }
    @total = 0
    @total_with_taxes = 0
  end

  def process_receipt
    @items.each do |item|
      process_item(item)
    end
    @receipt[:total_with_taxes] = @total_with_taxes
    @receipt[:total] = @total
    @receipt
  end

  private

  def process_item(item)
    item_object = { amount: item[:amount], item: item[:item] }
    price = find_price_with_taxes(item)
    item_object[:price_with_taxes] = price
    @receipt[:items] = @receipt[:items].push(item_object)
  end

  def find_price_with_taxes(item)
    gross_total = item[:price] * item[:amount]
    taxes = Taxes.new(item).calculate_taxes
    total_taxes = (taxes * item[:amount]).round(2)
    update_total_taxes(total_taxes)
    total = (gross_total + total_taxes).round(2)
    update_total(total)
    total
  end

  def update_total(price)
    @total += price
  end

  def update_total_taxes(taxes)
    @total_with_taxes += taxes
    @total_with_taxes = CustomRound.round_up_by005(@total_with_taxes)
  end
end
