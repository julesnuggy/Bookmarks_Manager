# Databases Challenge

## Background
This week, you will build a web app that stores web bookmarks in a database.

The website will have the following specification:
1. Show a list of links
2. Add new links
3. Delete links
4. Update links
5. Comment on Links
6. Tag links into categories
7. Filter links by tag
8. Users manage their links

## User Stories

Format:
As a [stakeholder],
I need / want [to be able to do something],
So that [I can achieve a goal],

As a user,
I want to be able to show a list of links,
So that I can easily navigate to saved websites of interest.

As a user,
I want to be able to add new links,
So that I can save websites of interest for future reading/use.

As a user,
I want to be able to delete links,
So that I shouldn't see these links anymore.

As a user,
I want to be able to update links,
So that I have the correct details for the link.

As a user,
I want to be able to comment on links,
So that I have a description of the link / webpage.

As a user,
I want to be be able to tag links into categories,
So that I can put similar links into groups / categories.

As a user,
I want to be able to filter links by tags,
So that I only see links of a particular tag-category.

As a user,
I want to be able to manage my links,
So that I can easily access and amend my saved links.


## Domain Model

```
  +--------------------+             +------------+                +-------------------+                 +-------------+
  |                    |             |            |                |                   |                 |             |
  |  Bookmarks Manager |             |   Printer  |                |   Website Links   |                 |     Tags    |
  |                    |             |            |                |                   |                 |             |
  +------------+-------+             +--------+---+                +----------+--------+                 +------+------+
               |                              |                               |                                 |
               |      Show Links              |                               |                                 |
               +------------------------------>                               |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                Add Link                                      |                                 |
               +--------------------------------------------------------------+                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                Delete Link                                   |                                 |
               +--------------------------------------------------------------+                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |               Update Link                                    |                                 |
               +--------------------------------------------------------------+                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                Comment Link                                  |                                 |
               +--------------------------------------------------------------+                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |      Add Tag                    |
               |                                                              +---------------------------------+
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |      Delete Tag                 |
               |                                                              +---------------------------------+
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |      Update Tag                 |
               |                                                              +---------------------------------+
               |                                                              |                                 |
               |                                                              |                                 |
               |                                                              |                                 |
               |            Filter Links by Tag                               |                                 |
               +-------------------------------------------------------------->                                 |
               |                                                              |                                 |
 +-------------+                                                              |                                 |
 |             |                                                              |                                 |
 |             |                                                              |                                 |
 Manage Links  |                                                              |                                 |
 |             |                                                              |                                 |
 |             |                                                              |                                 |
 +------------->                                                              |                                 |
               +                                                              +                                 +

```
## How To Use
1. Run `rake setup` to set up the databases and tables that you'll need for this app. It will set up a test database ("bookmark_manager_test") and a production database ("bookmark_manager"). Both databases will contain a table called "links". If you already have the databases set up, rake will just abort.

2. The db_connection.rb file uses the PG gem to connect to the PSQL server. There are 3 class methods:
  * `self.setup` sets up the connection to the database, allowing you to make queries to the database. It takes two arguments: the database name, and your username.
  * `self.connection` just checks that the connection has been made by returning the `@connection` class instance variable.
  * `self.query` allows you to make queries to the database. These should be in String format and need to follow the PSQL syntaxes and structures.

3. The db_connection_setup.rb file is used to appropriately connect to the right database, depending on whether you are running a test (RSpec) or the real program (via Rackup, Shotgun, etc.).

4. The link.rb file has 2 methods:
  * `self.all` returns the entire table from the database and assigns it to the `@all_bookmarks` instance variable, which is output to the index.erb file to process.
  * `self.add_bookmark` runs the Db_Connection class #query method to run an INSERT INTO query to add a bookmark to the "links" table.
