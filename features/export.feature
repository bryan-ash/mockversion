@announce
Feature: svn export

  Background:
    Given mockversion is loaded

@wip
  Scenario: export retrieves a file but does not create a working copy
    Given a repoistory at "/repos/repo" with:
      | revision | action | filename |
      |    123   | add    | file1    |

    When I run "svn export /repos/repo ."

    Then the following directories should not exist:
      | .svn  |
    And the following files should exist:
      | file1 |
