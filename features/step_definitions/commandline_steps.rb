Given /^mockversion is loaded$/ do
  load 'mockversion.rb'
end

Then /^the output should contain a help message$/ do
  Then 'the output should contain "MockVersion"'
  And  'the output should contain "Usage:"'
  And  'the output should contain "require \'mockversion\'"'
end
