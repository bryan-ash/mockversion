@announce
Feature: Working copy

  Background:
    Given mockversion is loaded

  Scenario: checkout creates a .svn directory
    Given I run "svnadmin create /repos/repo"
    When  I run "svn checkout /repos/repo ."
    Then  the following directories should exist:
      | .svn |
@wip
  Scenario: checkout creates a .svn directory
    Given a repoistory at "/repos/repo" with:
      | revision | action | filename |
      |    123   | add    | file1    |

    When I run "svn checkout /repos/repo ."

    Then the following files should exist:
      | file1 |
