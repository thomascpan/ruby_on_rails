require "rest-client"
url = "http://localhost:3000/users"
url2 = "http://localhost:3000/users/:id"
url3 = "http://localhost:3000/users/new"
url4 = "http://localhost:3000/users/:id/edit"
url5 = "http://localhost:3000/users"
puts RestClient.get(url)
puts RestClient.get(url2)
puts RestClient.get(url3)
puts RestClient.get(url4)
puts RestClient.post(url5, :param1 => 'one', :nested => { :param2 => 'two' })
