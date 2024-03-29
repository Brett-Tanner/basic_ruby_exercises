class Cypher

    attr_accessor :input_message, :key

    def initialize
        @input_message = get_message()
        @key = get_key()
        cypher()
    end

    def get_message
        puts "Please enter your message"
        message = gets.chomp
        unless message.ascii_only?
            puts "***Only ASCII characters are accepted***"
            message = get_message()
        end
        message
    end

    def get_key
        puts "What would you like to shift by?"
        gets.chomp.to_i
    end

    def cypher
        ascii_message = to_ascii(@input_message)
        shifted_message = apply_key(ascii_message)
        to_string(shifted_message)
    end

    def to_ascii(message)
        message.codepoints
    end

    def apply_key(ascii_array)
        ascii_array.map do |value|
            if (value > 64 && value < 91) || (value > 96 && value < 123)
                shifted_value = value + @key
                # wrap for capitals
                if shifted_value > 90 && shifted_value < 122
                    shifted_value - 90 + 64
                # wrap for lowercase
                elsif shifted_value > 122
                    shifted_value - 122 + 96
                else
                    shifted_value
                end
            else
                value
            end
        end
    end

    def to_string(shifted_array)
        result = shifted_array.map {|value| value.chr}.join
        puts result
        result
    end
end