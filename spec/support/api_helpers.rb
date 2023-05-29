# From: https://blog.devgenius.io/testing-a-rails-api-with-rspec-82dedc9f15df
module ApiHelpers
  def json
    JSON.parse(response.body)
  end
end
