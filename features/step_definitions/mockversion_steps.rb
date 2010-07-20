Given /^a repository at "([^\"]*)" with:$/ do |path, table|
  in_current_dir do
    repository = MockVersion::Repository.new(path)
    table.hashes.each do |file|
      revision = repository.create_new_revision(file['revision'])
      revision.add_file(file['filename'])
    end
    repository.save
  end
end
