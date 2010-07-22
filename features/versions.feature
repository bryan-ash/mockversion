@announce
Feature: Adding and committing files

  Background:
    Given I am using mockversion

  Scenario: When a new file is committed a new revision is created
    Given a file named "file" with:
      """
      This is a file
      """
    And I run "svnadmin create /repos/repo"

    When I run "svn checkout /repos/repo ."
    And  I run "svn add file"
    And  I run "svn commit -m \"new file\""
    And  I run "svnadmin verify /repos/repo"

    Then it should pass with:
      """
      * Verified revision 0.
      * Verified revision 1.
      """
