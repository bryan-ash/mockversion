@announce
Feature: svnadmin create

  Background:
    Given I am using mockversion

  Scenario: A directory is created for data storage
    When I run "svnadmin create /repos/repo"
    Then the following directories should exist:
      | .mockversion |

  Scenario: verifying an existing repository succeeds
    When I run "svnadmin create /repos/repo"
    When I run "svnadmin verify /repos/repo"
    Then it should pass with:
      """
      * Verified revision 0.
      """

  Scenario: verifying a non-existant repository fails
    When I run "svnadmin verify /repos/repo"
    Then it should fail with:
      """
      Can't open
      """
