module RoQua
  class Answer
    attr_accessor :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    def id
      @attributes["_id"]
    end

    def completed?
      @attributes["is_completed"]
    end

    def created_at
      Time.parse(attributes["created_at"])
    end

    def updated_at
      Time.parse(attributes["updated_at"])
    end

    def completed_at
      Time.parse(attributes["completed_at"])
    end

    def method_missing(name, *args)
      @attributes.fetch(name.to_s)
    end
  end
end
