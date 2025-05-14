require_relative '../lib/sales'
require_relative '../db/seed_data'

RSpec.describe Sales do
  include SeedData

  describe '#process_receipt' do
    let!(:receipt) { Sales.new(input3).process_receipt }

    it 'calculates the total and total with taxes correctly' do
      expect(receipt[:total]).to eq 98.38
      expect(receipt[:total_with_taxes]).to eq 7.90
    end

    it 'set price with taxes' do
      expect(receipt[:items][0][:price_with_taxes]).to eq 32.19
      expect(receipt[:items][1][:price_with_taxes]).to eq 20.89
      expect(receipt[:items][2][:price_with_taxes]).to eq 9.75
      expect(receipt[:items][3][:price_with_taxes]).to eq 35.55
    end
  end
end
