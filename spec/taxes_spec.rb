require_relative '../lib/taxes'

RSpec.describe Taxes do
  describe 'calculate_taxes' do
    context 'when items not imported' do
      context 'when items exempt' do
        let!(:item_exempt) { { item: 'book', amount: 2, price: 12.49, category: :books, imported: false } }

        it 'get imported tax only' do
          taxes = Taxes.new(item_exempt).calculate_taxes
          expect(taxes).to eq 0
        end
      end

      context 'when items not exempt' do
        let!(:item) { { item: 'music', amount: 1, price: 14.99, category: :music, imported: false } }

        it 'get imported tax only' do
          taxes = Taxes.new(item).calculate_taxes
          expect(taxes).to eq 1.5
        end
      end
    end

    context 'when items imported' do
      context 'when items exempt' do
        let!(:item_exempt) do
          { item: 'box of chocolates', amount: 3, price: 11.25, category: :food, imported: true }
        end

        it 'only imported tax' do
          taxes = Taxes.new(item_exempt).calculate_taxes
          expect(taxes).to eq 0.6
        end
      end

      context 'when items not exempt' do
        let!(:item) do
          { item: 'perfume', amount: 2, price: 47.50, category: :other, imported: true }
        end

        it 'imported and basic sales tax' do
          taxes = Taxes.new(item).calculate_taxes
          expect(taxes).to eq 7.15
        end
      end
    end
  end
end
