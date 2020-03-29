class RandomJsf
    def coinflip
        self.irand & 1
    end

    def extract!(array)
        len = array.length
        if len > 0
            array.slice!( self.irand % len )
        end
    end

    def pick(array)
        len = array.length
        if len > 0
            array[ self.irand % len ]
        end
    end

    def shuffle!(array)
        i = array.length
        if i < 2
            return
        end
        i -= 1
        while i > 0
            j = self.irand % (i + 1);
            if i == j
                next
            end
            array[i], array[j] = array[j], array[i]
            i -= 1
        end
    end
end

require "randomjsf/randomjsf"
