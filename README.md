# Thinkific REST API wrapper for Ruby

**Thinkific REST API wrapper for Ruby** simplifies interaction with the Thinkific API, allowing developers to seamlessly integrate Thinkific's powerful e-learning platform into their Ruby applications. Whether you're an organization creating a tailored solution for in-house use, an agency crafting customized learning experiences for clients, or an app developer aiming to build apps for the Thinkific App Store, this wrapper provides a convenient and efficient way to leverage Thinkific's capabilities.

## Key Features

- **Streamlined API Interactions in Ruby:** Easily communicate with Thinkific's API using Ruby, making development tasks straightforward and efficient.

- **Simplified Authentication and Configuration:** Hassle-free authentication and configuration setup for quick integration into your projects.

- **Easy Integration with Thinkific's Resources:** Seamlessly integrate with Thinkific's courses, users, and other essential resources, enhancing the functionality of your applications.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'thinkific'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install thinkific

## Usage

### Table of Contents

1. [Initialize](#initialize)
2. [Parameters & Query](#parameters)
3. [Bundles](#bundles)
4. [Categories](#categories)
5. [Category Memberships](#category-memberships)
6. [Chapters](#chapters)
7. [Contents](#contents)
8. [Coupons](#coupons)
9. [Courses](#courses)
10. [Course Reviews](#course-reviews)
11. [Custom Profile Field Definitions](#custom-profile-field-definitions)
12. [Enrollments](#enrollments)
13. [External Orders](#external-orders)
14. [Groups](#groups)
15. [Group Analysts](#group-analysts)
16. [Group Users](#group-users)
17. [Instructors](#instructors)
18. [Orders](#orders)
19. [Product Publish Request](#product-publish-request)
20. [Products](#products)
21. [Promotions](#promotions)
22. [Site Scripts](#site-scripts)
23. [Users](#users)


<a name="initialize"></a>

## Initialize

You have to create **thinkific.rb** file in your initializer directory and then specify API key and subdomain of you Thinkific account. The config file looking like this.

```ruby
Thinkific.config do |config|
  config.subdomain = 'your-subdomain'
  config.api_key   = 'your-api-key'
end
```


<a name="parameters"></a>

## Parameters & Query (filters)

Explore the comprehensive set of parameters and query filters available across all Thinkific API endpoints. When using this gem, you can simply provide the required parameters as a hash in your API requests.

For detailed information about each parameter and its usage, please refer to the [Thinkific API documentation](https://developers.thinkific.com/api/api-documentation/). Ensure that the parameters you provide align with the specifications outlined in the official documentation to ensure accurate and successful API interactions.



<a name="bundles"></a>

## Bundles - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Bundles)

#### Retrieve a Bundles:
```ruby
Thinkific::Admin::Bundles.show(ID)
```

#### List all courses by Bundle ID:
```ruby
Thinkific::Admin::Bundles.list_courses(ID, parameters)
```

#### List all enrollments by Bundle ID:
```ruby
Thinkific::Admin::Bundles.list_enrollments(ID, parameters)
```

#### Create an Enrollment in a Bundle:
```ruby
Thinkific::Admin::Bundles.create_enrollment(ID, parameters)
```

#### Update an Enrollment in a Bundle:
```ruby
Thinkific::Admin::Bundles.update_enrollment(ID, parameters)
```


<a name="categories"></a>

## Categories - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Categories)

#### List all Categories:
```ruby
Thinkific::Admin::Categories.list
```

#### Retrieve a Categories:
```ruby
Thinkific::Admin::Categories.show(ID)
```

#### Create a Categories:
```ruby
Thinkific::Admin::Categories.create(parameters)
```

#### Update a Categories:
```ruby
Thinkific::Admin::Categories.update(ID, parameters)
```

#### Delete a Categories:
```ruby
Thinkific::Admin::Categories.delete(ID)
```

#### List all products by a Categories:
```ruby
Thinkific::Admin::Categories.list_products(ID, parameters)
```


<a name="category-memberships"></a>

## Category Memberships - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Category%20Memberships)

#### Create products in a Categories:
```ruby
Thinkific::Admin::CategoryMembership.create_products(ID, parameters)
```

#### Delete products from a Categories:
```ruby
Thinkific::Admin::CategoryMembership.delete_products(ID, parameters)
```

<a name="chapters"></a>

## Chapters - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Chapters)

#### Retrieve a Chapters:
```ruby
Thinkific::Admin::Chapters.show(ID)
```

#### List all Contents by a Chapter ID:
```ruby
Thinkific::Admin::Chapters.list_contents(ID, parameters)
```

<a name="contents"></a>

## Contents - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Contents)

#### Retrieve a Contents by ID:
```ruby
Thinkific::Admin::Contents.show(ID)
```

<a name="coupons"></a>

## Coupons - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Coupons)

#### List all Coupons:
```ruby
Thinkific::Admin::Coupons.list
```

#### Retrieve a Coupons:
```ruby
Thinkific::Admin::Coupons.show(ID)
```

#### Create a Coupons:
```ruby
Thinkific::Admin::Coupons.create(parameters)
```

#### Bulk Create Coupons:
```ruby
Thinkific::Admin::Coupons.create_bulk_coupon(parameters)
```

#### Update a Coupons:
```ruby
Thinkific::Admin::Coupons.update(ID, parameters)
```

#### Delete a Coupons:
```ruby
Thinkific::Admin::Coupons.delete(ID)
```


<a name="courses"></a>

## Courses - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Courses)

#### List all Courses:
```ruby
Thinkific::Admin::Courses.list
```

#### Retrieve a Courses:
```ruby
Thinkific::Admin::Courses.show(ID)
```

#### List Chapters by Course ID
```ruby
Thinkific::Admin::Courses.list_chapters(ID, parameters)
```


<a name="course-reviews"></a>

## Course Review - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Course%20Reviews)

#### List all Course Reviews:
```ruby
Thinkific::Admin::CourseReviews.list
```

#### Retrieve a Course Reviews:
```ruby
Thinkific::Admin::CourseReviews.show(ID)
```

#### Create a Course Reviews:
```ruby
Thinkific::Admin::CourseReviews.create(parameters)
```


<a name="custom-profile-field-definitions"></a>

## Custom Profile Field Definitions - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Custom%20Profile%20Field%20Definitions)

#### List all Custom Profile Field Definition:
```ruby
Thinkific::Admin::CustomProfileFieldDefinitions.list
```


<a name="enrollments"></a>

## Enrollments - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Enrollments)

#### List all Enrollments:
```ruby
Thinkific::Admin::Enrollments.list
```

#### Retrieve an Enrollments:
```ruby
Thinkific::Admin::Enrollments.show(ID)
```

#### Create a Enrollments:
```ruby
Thinkific::Admin::Enrollments.create(parameters)
```

#### Update a Enrollments:
```ruby
Thinkific::Admin::Enrollments.update(ID, parameters)
```


<a name="external-orders"></a>

## External Orders - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/External%20Orders)

#### Create a External Order:
```ruby
Thinkific::Admin::ExternalOrders.create(parameters)
```

#### Create a Refund transaction in a External Order:
```ruby
Thinkific::Admin::ExternalOrders.refund_transaction(ID, parameters)
```

#### Create a Purchase transaction in a External Order:
```ruby
Thinkific::Admin::ExternalOrders.purchase_transaction(ID, parameters)
```


<a name="groups"></a>

## Groups - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Groups)

#### List all Groups:
```ruby
Thinkific::Admin::Groups.list
```

#### Retrieve a Groups:
```ruby
Thinkific::Admin::Groups.show(ID)
```

#### Create a Groups:
```ruby
Thinkific::Admin::Groups.create(parameters)
```

#### Delete a Groups:
```ruby
Thinkific::Admin::Groups.delete(ID)
```

#### List Analysts by a Groups:
```ruby
Thinkific::Admin::Groups.list_analysts(ID, parameters)
```

#### Create Analysts in a Groups:
```ruby
Thinkific::Admin::Groups.create_analysts(ID, parameters)
```

#### Delete an analyst from a group:
```ruby
Thinkific::Admin::Groups.delete_analyst(ID)
```

<a name="group-analysts"></a>

## Group Analysts - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Group%20Analysts)

#### Create Group-Analyst to a groups:
```ruby
Thinkific::Admin::GroupAnalysts.create_groups(user_id, parameters)
```

#### Delete Group-Analyst from a groups:
```ruby
Thinkific::Admin::GroupAnalysts.delete_analyst(user_id, group_id)
```


<a name="group-users"></a>

## Group Users - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Group%20Users)

#### Create a User to existing Groups:
```ruby
Thinkific::Admin::GroupUsers.create(parameters)
```


<a name="instructors"></a>

## Instructors - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Instructors)

#### List all Instructors:
```ruby
Thinkific::Admin::Instructors.list
```

#### Retrieve a Instructors:
```ruby
Thinkific::Admin::Instructors.show(ID)
```

#### Create a Instructors:
```ruby
Thinkific::Admin::Instructors.create(parameters)
```

#### Update a Instructors:
```ruby
Thinkific::Admin::Instructors.update(ID, parameters)
```

#### Delete a Instructors:
```ruby
Thinkific::Admin::Instructors.delete(ID)
```


<a name="orders"></a>

## Orders - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Orders)

#### List all Orders:
```ruby
Thinkific::Admin::Orders.list
```

#### Retrieve a Orders:
```ruby
Thinkific::Admin::Orders.show(ID)
```


<a name="product-publish-request"></a>

## Product Publish Request - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Product%20Publish%20Request)

#### List all Product Publish Request:
```ruby
Thinkific::Admin::ProductPublishRequest.list
```

#### Retrieve a Product Publish Request:
```ruby
Thinkific::Admin::ProductPublishRequest.show(ID)
```

#### Approve a Product Publish Request:
```ruby
Thinkific::Admin::ProductPublishRequest.approve(ID, parameters)
```

#### Deny a Product Publish Request:
```ruby
Thinkific::Admin::ProductPublishRequest.deny(ID, parameters)
```


<a name="products"></a>

## Products - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Products)

#### List all Products:
```ruby
Thinkific::Admin::Products.list
```

#### Retrieve a Products:
```ruby
Thinkific::Admin::Products.show(ID)
```

#### List all Related Products:
```ruby
Thinkific::Admin::Products.list_related(ID)
```


<a name="promotions"></a>

## Promotions - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Promotions)

#### List all Promotions:
```ruby
Thinkific::Admin::Promotions.list
```

#### Retrieve a Promotions:
```ruby
Thinkific::Admin::Promotions.show(ID)
```

#### Create a Promotions:
```ruby
Thinkific::Admin::Promotions.create(parameters)
```

#### Update a Promotions:
```ruby
Thinkific::Admin::Promotions.update(ID, parameters)
```

#### Delete a Promotions:
```ruby
Thinkific::Admin::Promotions.delete(ID)
```

#### Retrieve a Promotion by Coupon code:
```ruby
Thinkific::Admin::Promotions.get_coupon(parameters)
```

<a name="site-scripts"></a>

## Site Scripts - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Site%20Scripts)

#### List all Site script:
```ruby
Thinkific::Admin::SiteScripts.list
```

#### Retrieve a Site script:
```ruby
Thinkific::Admin::SiteScripts.show(ID)
```

#### Create a Site script:
```ruby
Thinkific::Admin::SiteScripts.create(parameters)
```

#### Update a Site script:
```ruby
Thinkific::Admin::SiteScripts.update(ID, parameters)
```

#### Delete a Site script:
```ruby
Thinkific::Admin::SiteScripts.delete(ID)
```


<a name="users"></a>

## Users - [Api Reference](https://developers.thinkific.com/api/api-documentation/#/Users)

#### List all Users:
```ruby
Thinkific::Admin::Users.list
```

#### Retrieve a Users:
```ruby
Thinkific::Admin::Users.show(ID)
```

#### Create a Users:
```ruby
Thinkific::Admin::Users.create(parameters)
```

#### Update a Users:
```ruby
Thinkific::Admin::Users.update(ID, parameters)
```

#### Delete a Users:
```ruby
Thinkific::Admin::Users.delete(ID)
```

#### Retrieves a User authentication data identified by the id and provider:
```ruby
Thinkific::Admin::Users.authentications(id, provider, parameters)
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rahulsingh321/thinkific. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/rahulsingh321/thinkific/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Thinkific project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rahulsingh321/thinkific/blob/master/CODE_OF_CONDUCT.md).
