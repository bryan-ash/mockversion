require 'optparse'
require 'ostruct'

module SVN
  module Command
    class Export < ::OptionParser

      def self.execute(args)
        command = new
        command.parse!(args)
        command.execute(args)
      end

      OPTIONS = {
        :revision => ["-r", "--revision arg",
                      "A revision argument can be one of:",
                      "  NUMBER   revision number",
                      "  HEAD     latest in repository"]
      }

      def initialize
        super
        @options = OpenStruct.new
        @options.revision = "HEAD"

        self.banner = "Usage: svn export [options] [URL] [path]"
        self.separator ""
        on(*OPTIONS[:revision]) { |revision| @options.revision = revision.upcase }
      end

      def execute(args)
        repo = MockVersion::Repository.load_from_path(args[0])
        repo.export_revision_to_path(@options.revision, args[1])        
      end

    end
  end
end
