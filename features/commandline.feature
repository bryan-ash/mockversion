@announce
Feature: Command line

  In order to demonstrate tools features during development
  As a SVN based tool developer
  I want a mock svn executable

  Scenario: tool existance
    When I run "svn --version"
    Then I should see "mockversion"
