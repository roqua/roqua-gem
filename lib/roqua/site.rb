module RoQua
  class Site
    attr_accessor :base_url
    attr_accessor :username
    attr_accessor :password

    def initialize(base_url, username, password)
      self.base_url = base_url
      self.username = username
      self.password = password
    end

    def answers(options = {})
      url = Addressable::URI.parse(@base_url)
      response = RestClient.get(url.to_s + "/patients/#{options[:patient_id]}/questionnaires/#{options[:questionnaire_key]}/answers")
      json = JSON.parse(response)
      json.map { |item| Answer.new(item) }
    end
  end
end
