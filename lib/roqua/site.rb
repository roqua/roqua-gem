module RoQua
  class Site
    attr_accessor :url
    attr_accessor :username
    attr_accessor :password

    def initialize(base_url, username, password)
      @url = Addressable::URI.parse(base_url)
      @url.user = username
      @url.password = password
    end

    def url
      @url.dup
    end

    def answers(options = {})
      response = RestClient.get(url.to_s + "/patients/#{options[:patient_id]}/questionnaires/#{options[:questionnaire_key]}/answers")
      json = JSON.parse(response)
      json.map { |item| Answer.new(item) }
    end

    def patient(id)
      response = RestClient.get(url.to_s + "/patients/#{id}")
      Patient.new(JSON.parse(response))
    end
  end
end
