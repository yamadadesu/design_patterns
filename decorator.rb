
class SimpleWriter
    def initialize(path)
		@file = File.open(path, "w")
    end

	def write_line(line)
		@file.print(line)
		@file.print("\n")
	end

	def rewind
		@file.rewind
	end

	def close
		@file.close
	end
end

class WriteDecorator
	def initialize(real_writer)
		@real_writer = real_writer
	end

	def write_line(line)
		@real_writer.write_line(line)
	end

	def pos
		@real_writer.pos
	end

	def rewind
		@real_writer.rewind
	end

	def close
		@real_writer.close
	end
end

class NumberingWriter < WriteDecorator
	def initialize(real_writer)
		super(real_writer)
		@line_number = 1
	end

	def write_line(line)
		@real_writer.write_line("#{@line_number} : #{line}")
	end
end

class TimestampingWriter < WriteDecorator
    def write_line(line)
        @real_writer.write_line("#{Time.new} : #{line}")
    end
end

f = NumberingWriter.new(SimpleWriter.new("file1.txt"))
f.write_line("Hello out there")
f.close
# file1.txtに以下の内容が出力される
#1 : Hello world

f = TimestampingWriter.new(SimpleWriter.new("file2.txt"))
f.write_line("Hello out there")
f.close
# file2.txtに以下の内容が出力される
#2012-12-09 12:55:38 +0900 : Hello out there

f = TimestampingWriter.new(NumberingWriter.new(SimpleWriter.new("file3.txt")))
f.write_line("Hello out there")
f.close
