module Requests
  module JsonHelpers
    def json
      @json ||= JSON.parse(response_body)
    end

    def data
      json['data']
    end

    def errors
      json['error']
    end

    def as_json(data)
      JSON.parse(data.to_json)
    end

    def ids(data)
      arr = []
      data.each { |x| arr << x[1]['id'] }
      arr
    end
  end
end

RSpec.configure do |config|
  config.include Requests::JsonHelpers, type: :request
end
