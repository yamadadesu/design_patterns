class Report
    attr_reader :title, :text
    attr_accessor :formatter

    def initialize(formatter)
        @title     = "月次報告"
        @text      = ["順調", "最高"]
        @formatter = formatter
    end

    def output_report()
        @formatter.output_report(self)
    end
end

class HTMLFormatter
    def output_report(context)
        puts self.class.to_s
        puts context.title
        context.text.each do |line|
            puts line
        end
    end
end

class PlainTextFormatter
    def output_report(context)
        puts self.class.to_s
        puts context.title
        context.text.each do |line|
            puts line
        end
    end
end

report = Report.new(HTMLFormatter.new)
report.output_report

report.formatter = PlainTextFormatter.new
report.output_report





