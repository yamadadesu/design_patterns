class Report
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize(&formatter)
        @title     = "月次報告"
        @text      = ["順調", "最高"]
        @formatter = formatter
    end

    def output_report()
        @formatter.call( self )
    end
end

HTML_FORMATTER = lambda do |ctx|
    puts "html"
end

PLAIN_TEXT_FORMATTER = lambda do |ctx|
    puts "plain"
end

report = Report.new(&HTML_FORMATTER)
report.output_report

report.formatter = PLAIN_TEXT_FORMATTER
report.output_report

=begin
#これだとstrategyっぽくない
html = Report.new do |ctx|
    puts "html"
    puts ctx.title
    ctx.text.each do |line|
        puts line
    end
end

plain = Report.new do |ctx|
    puts "plain"
    puts ctx.title
    ctx.text.each do |line|
        puts line
    end
end
=end

#html.output_report
#plain.output_report

