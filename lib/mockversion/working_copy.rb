require 'fileutils'

module MockVersion
  class WorkingCopy

    def self.create(repo_path, path)
      new(repo_path, path).save
    end

    def self.load
      YAML.load_file(".svn/working_copy.yml")
    end

    def initialize(repo_path, path)
      @repo_path = repo_path
      @path = path
    end

    def add(path)
      staged_files << path
      save
    end

    def commit(message)
      puts "committing to: #{@repo_path}"
      repo = Repository.load_from_path(@repo_path)
      repo.create_new_revision
    end

    def staged_files
      @staged_files ||= []
    end

    def save
      FileUtils.makedirs("#{@path}/.svn")
      File.open("#{@path}/.svn/working_copy.yml", "w") { |file| file.puts to_yaml }
    end

  end
end
