module RoQua
  class Patient
    attr_accessor :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def id
      @attributes["_id"]
    end

    def created_at
      Time.parse(attributes["created_at"])
    end

    def updated_at
      Time.parse(attributes["updated_at"])
    end

    def method_missing(name, *args)
      @attributes.fetch(name.to_s)
    end
  end
end
