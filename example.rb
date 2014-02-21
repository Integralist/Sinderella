require 'sinderella'

data = { :key => 'value' }
till_midnight = 60

id = Sinderella.transforms(data, till_midnight) do |data|
  data.each do |key, value|
    data.tap { |d| d[key].upcase! }
  end
end

puts Sinderella.get(id)

puts "Resetting data early" and Sinderella.midnight(id) if (rand() * 2).to_i == 1 # randomly reset the data early...

sleep 10

puts Sinderella.get(id)

sleep 60

puts Sinderella.get(id)
