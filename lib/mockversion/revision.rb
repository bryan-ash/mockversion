module MockVersion
  class Revision

    attr_reader :number

    def initialize(number = 0)
      @number = number
    end

    def export_to(path)
      files.each do |filename|
        File.open("#{path}/#{filename}", "w") { |file| file.puts @number }
      end
    end

    def add_file(filename)
      files << filename
    end

    def files
      @files ||= []
    end

  end
end
