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

You have to create **thinkific.rb** file in your initializer directory and then specify client-id and secret-key of you Thinkific account. The config file looking like this.

```ruby
Thinkific.config do |config|
  config.client_id = 'your-client-id'
  config.secret_key   = 'your-secret-key'
end
```


<a name="parameters"></a>

## Parameters & Query (filters)

Explore the comprehensive set of parameters and query filters available across all Thinkific API endpoints. When using this gem, you can simply provide the required parameters as a hash in your API requests.

For detailed information about each parameter and its usage, please refer to the [Thinkific API documentation](https://developers.thinkific.com/api/api-documentation/). Ensure that the parameters you provide align with the specifications outlined in the official documentation to ensure accurate and successful API interactions.



## <a name="bundles" href="https://developers.thinkific.com/api/api-documentation/#/Bundles">Bundles</a>
```ruby

    # Retrieve a Bundles:
    Thinkific::Admin::Bundles.show(ID)

    # List all courses by Bundle ID:
    Thinkific::Admin::Bundles.list_courses(ID, parameters)

    # List all enrollments by Bundle ID:
    Thinkific::Admin::Bundles.list_enrollments(ID, parameters)

    # Create an Enrollment in a Bundle:
    Thinkific::Admin::Bundles.create_enrollment(ID, parameters)

    # Update an Enrollment in a Bundle:
    Thinkific::Admin::Bundles.update_enrollment(ID, parameters)

```


## <a name="categories" href="https://developers.thinkific.com/api/api-documentation/#/Categories">Categories</a>
```ruby

    # List all Categories:
    Thinkific::Admin::Categories.list

    # Retrieve a Categories:
    Thinkific::Admin::Categories.show(ID)

    # Create a Categories:
    Thinkific::Admin::Categories.create(parameters)

    # Update a Categories:
    Thinkific::Admin::Categories.update(ID, parameters)

    # Delete a Categories:
    Thinkific::Admin::Categories.delete(ID)

    # List all products by a Categories:
    Thinkific::Admin::Categories.list_products(ID, parameters)

```


## <a name="category-memberships" href="https://developers.thinkific.com/api/api-documentation/#/Category%20Memberships">Category Memberships</a>
```ruby

    # Create products in a Categories:
    Thinkific::Admin::CategoryMembership.create_products(ID, parameters)

    # Delete products from a Categories:
    Thinkific::Admin::CategoryMembership.delete_products(ID, parameters)

```


## <a name="chapters" href="https://developers.thinkific.com/api/api-documentation/#/Chapters">Chapters</a>
```ruby

    # Retrieve a Chapters:
    Thinkific::Admin::Chapters.show(ID)

    # List all Contents by a Chapter ID:
    Thinkific::Admin::Chapters.list_contents(ID, parameters)

```


## <a name="contents" href="https://developers.thinkific.com/api/api-documentation/#/Contents">Contents</a>
```ruby

    # Retrieve a Contents by ID:
    Thinkific::Admin::Contents.show(ID)

```


## <a name="coupons" href="https://developers.thinkific.com/api/api-documentation/#/Coupons">Coupons</a>
```ruby

    # List all Coupons:
    Thinkific::Admin::Coupons.list

    # Retrieve a Coupons:
    Thinkific::Admin::Coupons.show(ID)

    # Create a Coupons:
    Thinkific::Admin::Coupons.create(parameters)

    # Bulk Create Coupons:
    Thinkific::Admin::Coupons.create_bulk_coupon(parameters)

    # Update a Coupons:
    Thinkific::Admin::Coupons.update(ID, parameters)

    # Delete a Coupons:
    Thinkific::Admin::Coupons.delete(ID)

```


## <a name="courses" href="https://developers.thinkific.com/api/api-documentation/#/Courses">Courses</a>
```ruby

    # List all Courses:
    Thinkific::Admin::Courses.list

    # Retrieve a Courses:
    Thinkific::Admin::Courses.show(ID)

    # List Chapters by Course ID
    Thinkific::Admin::Courses.list_chapters(ID, parameters)

```


## <a name="course-reviews" href="https://developers.thinkific.com/api/api-documentation/#/Course%20Reviews">Course Review</a>
```ruby

    # List all Course Reviews:
    Thinkific::Admin::CourseReviews.list

    # Retrieve a Course Reviews:
    Thinkific::Admin::CourseReviews.show(ID)

    # Create a Course Reviews:
    Thinkific::Admin::CourseReviews.create(parameters)

```


## <a name="custom-profile-field-definitions" href="https://developers.thinkific.com/api/api-documentation/#/Custom%20Profile%20Field%20Definitions">Custom Profile Field Definitions</a>
```ruby

    # List all Custom Profile Field Definition:
    Thinkific::Admin::CustomProfileFieldDefinitions.list

```


## <a name="enrollments" href="https://developers.thinkific.com/api/api-documentation/#/Enrollments">Enrollments</a>
```ruby

    # List all Enrollments:
    Thinkific::Admin::Enrollments.list

    # Retrieve an Enrollments:
    Thinkific::Admin::Enrollments.show(ID)

    # Create a Enrollments:
    Thinkific::Admin::Enrollments.create(parameters)

    # Update a Enrollments:
    Thinkific::Admin::Enrollments.update(ID, parameters)

```


## <a name="external-orders" href="https://developers.thinkific.com/api/api-documentation/#/External%20Orders">External Orders</a>
```ruby

    # Create a External Order:
    Thinkific::Admin::ExternalOrders.create(parameters)

    # Create a Refund transaction in a External Order:
    Thinkific::Admin::ExternalOrders.refund_transaction(ID, parameters)

    # Create a Purchase transaction in a External Order:
    Thinkific::Admin::ExternalOrders.purchase_transaction(ID, parameters)

```


## <a name="groups" href="https://developers.thinkific.com/api/api-documentation/#/Groups">Groups</a>
```ruby

    # List all Groups:
    Thinkific::Admin::Groups.list

    # Retrieve a Groups:
    Thinkific::Admin::Groups.show(ID)

    # Create a Groups:
    Thinkific::Admin::Groups.create(parameters)

    # Delete a Groups:
    Thinkific::Admin::Groups.delete(ID)

    # List Analysts by a Groups:
    Thinkific::Admin::Groups.list_analysts(ID, parameters)

    # Create Analysts in a Groups:
    Thinkific::Admin::Groups.create_analysts(ID, parameters)

    # Delete an analyst from a group:
    Thinkific::Admin::Groups.delete_analyst(ID)

```


## <a name="group-analysts" href="https://developers.thinkific.com/api/api-documentation/#/Group%20Analysts">Group Analysts</a>
```ruby

    # Create Group-Analyst to a groups:
    Thinkific::Admin::GroupAnalysts.create_groups(user_id, parameters)

    # Delete Group-Analyst from a groups:
    Thinkific::Admin::GroupAnalysts.delete_analyst(user_id, group_id)

```


## <a name="group-users" href="https://developers.thinkific.com/api/api-documentation/#/Group%20Users">Group Users</a>
```ruby

    # Create a User to existing Groups:
    Thinkific::Admin::GroupUsers.create(parameters)

```


## <a name="instructors" href="https://developers.thinkific.com/api/api-documentation/#/Instructors">Instructors</a>
```ruby

    # List all Instructors:
    Thinkific::Admin::Instructors.list

    # Retrieve a Instructors:
    Thinkific::Admin::Instructors.show(ID)

    # Create a Instructors:
    Thinkific::Admin::Instructors.create(parameters)

    # Update a Instructors:
    Thinkific::Admin::Instructors.update(ID, parameters)

    # Delete a Instructors:
    Thinkific::Admin::Instructors.delete(ID)

```


## <a name="orders" href="https://developers.thinkific.com/api/api-documentation/#/Orders">Orders</a>
```ruby

    # List all Orders:
    Thinkific::Admin::Orders.list

    # Retrieve a Orders:
    Thinkific::Admin::Orders.show(ID)

```


## <a name="product-publish-request" href="https://developers.thinkific.com/api/api-documentation/#/Product%20Publish%20Request">Product Publish Request</a>
```ruby

    # List all Product Publish Request:
    Thinkific::Admin::ProductPublishRequest.list

    # Retrieve a Product Publish Request:
    Thinkific::Admin::ProductPublishRequest.show(ID)

    # Approve a Product Publish Request:
    Thinkific::Admin::ProductPublishRequest.approve(ID, parameters)

    # Deny a Product Publish Request:
    Thinkific::Admin::ProductPublishRequest.deny(ID, parameters)

```


## <a name="products" href="https://developers.thinkific.com/api/api-documentation/#/Products">Products</a>
```ruby

    # List all Products:
    Thinkific::Admin::Products.list

    # Retrieve a Products:
    Thinkific::Admin::Products.show(ID)

    # List all Related Products:
    Thinkific::Admin::Products.list_related(ID)

```


## <a name="promotions" href="https://developers.thinkific.com/api/api-documentation/#/Promotions">Promotions</a>
```ruby

    # List all Promotions:
    Thinkific::Admin::Promotions.list

    # Retrieve a Promotions:
    Thinkific::Admin::Promotions.show(ID)

    # Create a Promotions:
    Thinkific::Admin::Promotions.create(parameters)

    # Update a Promotions:
    Thinkific::Admin::Promotions.update(ID, parameters)

    # Delete a Promotions:
    Thinkific::Admin::Promotions.delete(ID)

    # Retrieve a Promotion by Coupon code:
    Thinkific::Admin::Promotions.get_coupon(parameters)

```


## <a name="site-scripts" href="https://developers.thinkific.com/api/api-documentation/#/Site%20Scripts">Site Scripts</a>
```ruby

    # List all Site script:
    Thinkific::Admin::SiteScripts.list

    # Retrieve a Site script:
    Thinkific::Admin::SiteScripts.show(ID)

    # Create a Site script:
    Thinkific::Admin::SiteScripts.create(parameters)

    # Update a Site script:
    Thinkific::Admin::SiteScripts.update(ID, parameters)

    # Delete a Site script:
    Thinkific::Admin::SiteScripts.delete(ID)

```


## <a name="users" href="https://developers.thinkific.com/api/api-documentation/#/Users">Users</a>
```ruby

    # List all Users:
    Thinkific::Admin::Users.list

    # Retrieve a Users:
    Thinkific::Admin::Users.show(ID)

    # Create a Users:
    Thinkific::Admin::Users.create(parameters)

    # Update a Users:
    Thinkific::Admin::Users.update(ID, parameters)

    # Delete a Users:
    Thinkific::Admin::Users.delete(ID)

    # Retrieves a User authentication data identified by the id and provider:
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
