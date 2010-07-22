@announce
Feature: Working copy

  Background:
    Given I am using mockversion

  Scenario: checkout creates a .svn directory
    Given I run "svnadmin create /repos/repo"
    When  I run "svn checkout /repos/repo ."
    Then  the following directories should exist:
      | .svn |

  Scenario: checkout retrieves a file into the working copy
    Given a repository at "/repos/repo" with:
      | revision | action | filename |
      |    123   | add    | file1    |

    When I run "svn checkout /repos/repo ."

    Then the following directories should exist:
      | .svn  |
    And the following files should exist:
      | file1 |

