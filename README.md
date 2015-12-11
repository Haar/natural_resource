# Natural Resource

<img src="http://www.terracoding.com/assets/images/natural-resource.png" alt="Logo" height="200px"/>

Natural Resource is a small but opinionated framework built ontop of some of our favourite gems. It is designed to speed up CRUD related activities whilst still maintaining sensible standards (e.g. Admin Panel, expandable principles for an API). It utilises [Pundit](https://github.com/elabs/pundit) for authorisation and [Ransack](https://github.com/activerecord-hackery/ransack) for searching and filtering.

Sponsored by [Terracoding](http://terracoding.com).

## Why?

Our common use-case for Natural Resource is in any back-end/admin-style sections of a website. Rather than go for an out-the-box solution such as ActiveAdmin, where you have a good set of defaults but a non-rails extension pattern, we decided to speed up building a default rails-based solution, where extensions and additions are straightforward and easy to understand for anyone with basic rails understanding. The codebase is small and easy to build upon, whilst enforcing authorisation out-the-box.

We found the pattern straightforward and useful, and used the experience to help in building a standardised API using the same approach (with a couple of precondition extensions to pundit returning appropriate 412 HTTP responses). We may look to open-sourcing the API extensions soon too!


# Getting Started

Simply install the gem

``` ruby
  gem 'natural_resource'
```
Setup the Base Policy:
``` sh
rails g natural:install
```

Then generate controllers/policies as required:

``` sh
rails g natural:resource controller_name optional_model_name
```

The overall codebase for NaturalResource is very small and the bulk of the functionality can be found in `lib/natural_resource/controller.rb`, it's all relatively simple ruby code designed to be expanded on top for any custom functionality. To understand how Pundit works I suggest visiting their repository and going through the basics.

# Contributing

All contributions are welcome, simply fork the project and make a Pull Request upstream.

# Testing

Simply run the `rspec` test suite from the `spec/dummy` folder.

# License

Licensed under the MIT license, see the separate MIT-LICENSE.txt file.
