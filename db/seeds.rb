
puts 'CREATE THE DEFAULTS TRANSACTIONS'
file = File.read('seeds_files/transactions.json')
data_hash = JSON.parse(file)
Deal.delete_all
data_hash['transactions'].each do |transaction|
  old = Deal.where(type_transaction: transaction['type_transaction'])
  unless old.present?
    Deal.create(type_transaction: transaction['type_transaction'], description: transaction["description"], nature: transaction['nature'], signal: transaction['signal'])
  end
end