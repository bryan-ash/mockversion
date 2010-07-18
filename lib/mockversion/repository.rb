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
      @revisions = [0]
    end

    def verify
      puts @revisions.map { |revision| "* Verified revision #{revision}.\n" }
    end

    def checkout_to(path)
      WorkingCopy.create(@repo_path, path)
    end

    def create_new_revision
      @revisions << 1
      save
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
