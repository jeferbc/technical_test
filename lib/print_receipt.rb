class PrintReceipt
  def self.call(title, receipt)
    puts "\n#{title}"
    puts '-' * 40
    puts format("%-10s %-25s %6s", "Cantidad", "Item", "Price")

    receipt[:items].each do |item|
      puts format("%-10d %-25s %6.2f", item[:amount], item[:item], item[:price_with_taxes])
    end

    puts '-' * 40
    puts format("%-30s %6.2f", "Sales Taxes:", receipt[:total_with_taxes])
    puts format("%-30s %6.2f", "Total:", receipt[:total])
  end
end
