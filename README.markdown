MockVersion
===========
A mock for the svn command line, created to help tool development

Installation
------------
    gem install mockversion

Usage
-----
    require 'mockversion'

    `svn help`
    => Mockversion - A mock for the svn command line, created to help tool development"

    `svnadmin help`
    => Mockversion - A mock for the svn command line, created to help tool development"

Using with Cucumber
-------------------
in features/support/env.rb:
    require 'mockversion/cucumber_steps'

then in a feature:
  Scenario: export retrieves a file but does not create a working copy
    Given I am using mockversion
    And a repository at "/repos/repo" with:
      | revision | action | filename |
      |    123   | add    | file1    |

    When I run "svn export /repos/repo ."

    Then the following files should exist:
      | file1 |


Copyright
---------
Copyright (c) 2010 Bryan Ash.  See LICENSE for details.
