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

html.output_report
plain.output_report

