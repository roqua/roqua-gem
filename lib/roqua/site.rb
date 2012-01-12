module RoQua
  class Site
    attr_accessor :base_url

    def initialize(base_url)
      self.base_url = base_url
    end

    def answers(options = {})
      url = Addressable::URI.parse(@base_url)
      response = RestClient.get(url.to_s + "/patients/#{options[:patient_id]}/questionnaires/#{options[:questionnaire_key]}/answers")
      json = JSON.parse(response)
      json.map { |item| Answer.new(item) }
    end
  end
end
