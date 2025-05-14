module SeedData
  def input1
    [
      { item: 'book', amount: 2, price: 12.49, category: :books, imported: false },
      { item: 'music', amount: 1, price: 14.99, category: :music, imported: false },
      { item: 'chocolate', amount: 1, price: 0.85, category: :food, imported: false }
    ]
  end

  def input2
    [
      { item: 'box of chocolates', amount: 1, price: 10, category: :food, imported: true },
      { item: 'perfume', amount: 1, price: 47.50, category: :other, imported: true }
    ]
  end

  def input3
    [
      { item: 'bottle of perfume', amount: 1, price: 27.99, category: :other, imported: true },
      { item: 'bottle of perfume', amount: 1, price: 18.99, category: :other, imported: false },
      { item: 'bottle of headache pills', amount: 1, price: 9.75, category: :medical, imported: false },
      { item: 'box of chocolates', amount: 3, price: 11.25, category: :food, imported: true }
    ]
  end
end
