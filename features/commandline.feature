@announce
Feature: Command line

  In order to demonstrate tools features during development
  As a SVN based tool developer
  I want a mock svn executable

  Scenario: Original svn is used before mockversion is loaded
    When I run "svn --version"
    Then the output should not contain "mockversion"

  Scenario: mockversion talks once it is loaded
    Given mockversion is loaded
    When I run "svn --version"
    Then the output should match /mockversion [0-9]\.[0-9]\.[0-9]/

