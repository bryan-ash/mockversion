Given /^a repoistory at "([^\"]*)" with:$/ do |path, table|
  in_current_dir do
    repository = MockVersion::Repository.new(path)
    table.hashes.each do |file|
      revision = MockVersion::Revision.new(file['revision'])
      revision.add_file(file['filename'])
      repository.add_revision(revision)
    end
  end
end
