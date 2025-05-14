require_relative './db/seed_data'
require_relative './lib/sales'
require_relative './lib/print_receipt'
include SeedData

receipt1 = Sales.new(input1).process_receipt
receipt2 = Sales.new(input2).process_receipt
receipt3 = Sales.new(input3).process_receipt

PrintReceipt.call('receipt1', receipt1)
PrintReceipt.call('receipt2', receipt2)
PrintReceipt.call('receipt3', receipt3)
