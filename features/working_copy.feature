@announce
Feature: Working copy

  Background:
    Given mockversion is loaded

  Scenario: When a new file is committed a new revision is created
    Given I run "svnadmin create /repos/repo"

    When I run "svn checkout /repos/repo ."

    Then the following directories should exist:
      | .svn |
