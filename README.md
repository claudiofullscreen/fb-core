# Fb::Core

Fb::Core provides methods to interact with Facebook users and pages through the Facebook Graph API.

[![Build Status](http://img.shields.io/travis/Fullscreen/fb-core/master.svg)](https://travis-ci.org/Fullscreen/fb-core)
[![Coverage Status](http://img.shields.io/coveralls/Fullscreen/fb-core/master.svg)](https://coveralls.io/r/Fullscreen/fb-core)
[![Dependency Status](http://img.shields.io/gemnasium/Fullscreen/fb-core.svg)](https://gemnasium.com/Fullscreen/fb-core)
[![Code Climate](http://img.shields.io/codeclimate/github/Fullscreen/fb-core.svg)](https://codeclimate.com/github/Fullscreen/fb-core)
[![Online docs](http://img.shields.io/badge/docs-✓-green.svg)](http://www.rubydoc.info/gems/fb-core/frames)
[![Gem Version](http://img.shields.io/gem/v/fb-core.svg)](http://rubygems.org/gems/fb-core)

The **source code** is available on [GitHub](https://github.com/Fullscreen/fb-core) and the **documentation** on [RubyDoc](http://www.rubydoc.info/gems/fb-core/frames).

### Installing and Configuring

Add `fb-core` to your Gemfile and run `bundle install`.

Most methods of this library require to have an access token of a Facebook user.
If you need to obtain one programmatically, use the [fb-auth](https://github.com/Fullscreen/fb-auth) library.

## Usage

Fb::User#email
--------------

Given an user access token with the `email` scope, you can get the user's email by calling:

```ruby
user = Fb::User.new access_token: '--valid-access-token--'
user.email # => 'john.smith@example.com'
```

Fb::User#pages
--------------

Given an user access token with the `pages_show_list` scope, you can get the list of Facebook pages managed by the user by calling:

```ruby
user = Fb::User.new access_token: '--valid-access-token--'
user.pages
# => [#<Fb::Page: id="1234", name="sample1">, #<Fb::Page: id="5678", name="sample2">]
```

Fb::Page#posts
--------------

Given a page with posts, you can get the posts on the page since creation by calling:

```ruby
user = Fb::User.new access_token: '--valid-access-token--'
page = user.pages.first
page.posts
# => [#<Fb::Post: id="1234", type="video">, #<Fb::Post: id="5678", type="video">]
```

Fb::Page#like_count
--------------

Given a page with insights data (verify on the insights section of the page), you can get the the number of likes for the page.

```ruby
user = Fb::User.new access_token: '--valid-access-token--'
page = user.pages.first
page.like_count
# => 15000
```

Pass an `until` option to aggregate the data only up to a certain date.

```ruby
page.like_count until: Date.today - 7
# => 10000
```

Fb::Page#view_count
--------------

You can also get the the number of views for the page.

```ruby
user = Fb::User.new access_token: '--valid-access-token--'
page = user.pages.first
page.like_count
# => 12345
```

Pass an `until` option to aggregate the data only up to a certain date.

```ruby
page.like_count until: Date.today - 7
# => 10000
```

## Development

To run tests, obtain a long-term access token for a Facebook user who manages
at least one page and includes `email` and `manage_pages` scopes. Set the token as:

    export FB_TEST_ACCESS_TOKEN="YourToken"

Then, run `rake spec` to run the tests.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Thanks :tada:
