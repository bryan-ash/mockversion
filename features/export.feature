@announce
Feature: svn export

  Background:
    Given I am using mockversion

  Scenario: export retrieves a file but does not create a working copy
    Given a repository at "/repos/repo" with:
      | revision | action | filename |
      |    123   | add    | file1    |

    When I run "svn export /repos/repo ."

    Then the following directories should not exist:
      | .svn  |
    And the following files should exist:
      | file1 |

  Scenario: export a specific revision
    Given a repository at "/repos/repo" with:
      | revision | action | filename |
      |    123   | add    | file1    |
      |    124   | add    | file2    |
      |    125   | add    | file3    |

    When I run "svn export -r 124 /repos/repo ."

    Then the following files should exist:
      | file1 |
      | file2 |
    And the following files should not exist:
      | file3 |
