class MuggleWords

    def searchPalindromes
        @palabras_encontradas.each do |palabra|
        
            if palindrome?(palabra)
                if not @cantidadLow.include?(palabra.downcase)
                    @cantidadLow.push(palabra.downcase)
                    @cantidad.push(palabra)
                end
            end
        end
    end

    def json
        @cantidad
    end

    def cantidadSize
        cantidad.size.toString
    end

    def initialize(string)
        @palabras_encontradas = string.gsub(/[^-a-zA-Z]/, ' ').split
        @cantidad= []
        @cantidadLow=[]
        searchPalindromes
    end

    def palindrome?(str)
        letters = str.downcase
        letters == letters.reverse
    end

    def existPal?
        @cantidad.size == 0
    end

    def to_view
        existPal? ? :homescreen : :palabrasMagicas
    end
end