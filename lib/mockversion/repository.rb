require 'fileutils'
require 'yaml'

module MockVersion
  class Repository
    
    def self.create(path)
      new(path).save
    end

    def self.verify(path)
      load_from_path(path).verify
    end

    def self.load_from_path(path)
      begin
        repo = new(path)
        YAML.load_file(repo.repo_file)
      rescue
        puts "Can't open"
        exit 1
      end
    end

    def initialize(path)
      @repo_path = path
      @revisions = [Revision.new]
    end

    def verify
      puts @revisions.map { |revision| "* Verified revision #{revision.number}.\n" }
    end

    def checkout_to(path)
      WorkingCopy.create(@repo_path, path)
      @revisions.last.export_to(path)
    end

    def export_to(path)
      WorkingCopy.create(@repo_path, path)
      @revisions.last.export_to(path)
    end

    def add_revision(revision)
      @revisions << revision
      save
    end

    def create_new_revision
      add_revision(Revision.new(1))
    end

    def save
      FileUtils.makedirs(full_repo_path)
      File.open(repo_file, "w") { |file| file.puts to_yaml }      
    end

    def full_repo_path
      ".mockversion/#{@repo_path}"
    end

    def repo_file
      "#{full_repo_path}/repo.yml"
    end

  end
end
