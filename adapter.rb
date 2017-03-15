# 特異メソッドを使ってAdapterを表現した場合のコード

class OldPrinter
    def initialize(string)
        @string = string.dup
    end
    
    def show_with_bracket
        puts "[#{@string}]"
    end
    
    def show_with_asterrisk
        puts "**#{@string}**"
    end
end

class Printer
    def initialize(obj)
        @obj = obj
    end

    def print_weak
        @obj.print_weak
    end

    def print_strong
        @obj.print_strong
    end
end

text = OldPrinter.new("hello")
def text.print_weak
    show_with_bracket
end

def text.print_strong
    show_with_asterrisk
end

p = Printer.new(text)

p.print_weak

p.print_strong

__END__
# 利用者(Client)へのインターフェイス (Target)
class Printer
    def initialize(obj)
        @obj = obj
    end

    def print_weak
        @obj.print_weak
    end

    def print_strong
        @obj.print_strong
    end
end

# Targetにはないインターフェイスを持つ (Adaptee)
class OldPrinter
    def initialize(string)
        @string = string.dup
    end
    
    def show_with_paren
        puts "(#{@string})"
    end
    
    def show_with_aster
        puts "*#{@string}*"
    end
end

# Targetが利用できるインターフェイスに変換 (Adapter)
class Adapter
    def initialize(string)
        @old_printer = OldPrinter.new(string)
    end

    def print_weak
        @old_printer.show_with_paren
    end

    def print_strong
        @old_printer.show_with_aster
    end
end

p = Printer.new(Adapter.new("hello"))
p.print_weak

p.print_strong