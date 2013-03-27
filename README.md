# gastropod

Simple library for generating slugs

![Code Climate](https://codeclimate.com/github/vigetlabs/gastropod.png)

![gastropod](http://i.imgur.com/5UhkBfI.jpg)

## Install

1. Update your Gemfile: `gem 'gastropod'`
2. Add a 'slug' column to your table.
3. Extend gastropod in your model
4. Call `assign_generated_slug` to generate a slug

## ActiveRecord Example

    class Product < ActiveRecord::Base
      extend Gastropod
      include Gastropod::ActiveRecord::Validations # Roll your own for other ORMs

      # Method to generate a slug against
      slug :name
    end

## Sequel Example

    DB = Sequel.connect('sqlite://db/sequel.db')

    DB.create_table? :fruits do
      primary_key :id
      String :name
      String :slug
    end

    class Fruit < Sequel::Model
      extend Gastropod

      slug :name

      def before_save
        assign_generated_slug
      end
    end

## Customisation

Override the instance method 'slug_finder' for custom scoping

## Contributing
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2013 James Cook & Patrick Reagan (Viget). See MIT_LICENSE for further details.
