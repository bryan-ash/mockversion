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

    def export_revision_to_path(revision_id, path)
      if revision_id == "HEAD"
        revision = @revisions.last
      else
        revision = @revisions.find { |revision| revision.number == revision_id }
      end
      
      revision.export_to(path)
    end

    def add_revision(revision)
      @revisions << revision
      save
    end

    def create_new_revision(number = '1')
      last_lower_revision = last_revision_lower_than(number)
      new_revision = last_lower_revision.dup
      new_revision.files = last_lower_revision.files.dup
      new_revision.number = number
      add_revision(new_revision)
      new_revision
    end

    def last_revision_lower_than(number)
      @revisions.find_all { |revision| revision.number < number }.last
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
