class SavedData
    
    attr_accessor :base_value, :conversion_value

    def initialize(base_value = nil, conversion_value = nil)
        @base_value = base_value
        @conversion_value = conversion_value
    end
end
