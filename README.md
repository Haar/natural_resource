# Natural Resource

<img src="http://www.terracoding.com/assets/images/natural-resource.png" alt="Logo" height="200px"/>

Natural Resource is a small but opinionated framework built ontop of some of our favourite gems. It is designed to speed up CRUD related activities whilst still maintaining sensible standards (e.g. Admin Panel, expandable principles for an API). It utilises [Pundit](https://github.com/elabs/pundit) for authorisation and [Ransack](https://github.com/activerecord-hackery/ransack) for searching and filtering.

Sponsored by [Terracoding](http://terracoding.com)

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
