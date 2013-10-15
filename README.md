# Airbrite

Ruby bindings for the [Airbrite API](https://github.com/airbrite/airbrite-api).

## Installation

Add this line to your application's Gemfile:

    gem 'airbrite'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install airbrite

## Usage

### Getting Started

    Airbrite.api_key = "my_secret_key"

### Products

#### Create

    params = {
      :sku => "foo",
      :price => 12345,
      :name => "Pebble",
      :description => "An awesome watch",
      :metadata => {...}
    }
    product = Airbrite::Product.create params

    # or

    product = Airbrite::Product.new params
    product.save

#### Retrieve

    product = Airbrite::Product.fetch :_id => "foo"

    # or

    product = Airbrite::Product.new :_id => "foo"
    product.refresh

#### Update

    product = # ... obtain a product
    product.name = "Pebble V9"
    product.save

#### List

Accepts Filters.

    result = Airbrite::Product.list
    products = result.data
    paging = result.paging

### Orders

#### Create

    params = {...}
    order = Airbrite::Order.create params

    # or

    order = Airbrite::Order.new params
    order.save

#### Retrieve

    order = Airbrite::Order.fetch :_id => "foo"

    # or

    order = Airbrite::Order.new :_id => "foo"
    order.refresh

#### Update

    order = # ... obtain a order
    order.metadata = {...}
    order.save

#### List

Accepts Filters.

    result = Airbrite::Order.list
    orders = result.data
    paging = result.paging


### Payments

#### Create

    params = {:order_id => "o_id", ...}
    payment = Airbrite::Payment.create params

    # or

    payment = Airbrite::Payment.new params
    payment.save

#### Retrieve

    payment = Airbrite::Payment.fetch :order_id => "o_id", :_id => "foo"

    # or

    payment = Airbrite::Payment.new :order_id => "o_id", :_id => "foo"
    payment.refresh

#### Update

    payment = # ... obtain a payment
    payment.metadata = {...}
    payment.save

#### List

Accepts Filters.

    result = Airbrite::Payment.list :order_id => "o_id"
    payments = result.data
    paging = result.paging

#### Charge

    payment = # ... obtain a payment
    payment.charge

#### Authorize

    payment = # ... obtain a payment
    payment.authorize

#### Capture

    payment = # ... obtain a payment
    payment.capture

#### Refund

    payment = # ... obtain a payment
    payment.refund amount


### Shipments

#### Create

    params = {:order_id => "o_id", ...}
    shipment = Airbrite::Shipment.create params

    # or

    shipment = Airbrite::Shipment.new params
    shipment.save

#### Retrieve

    shipment = Airbrite::Shipment.fetch :order_id => "o_id", :_id => "foo"

    # or

    shipment = Airbrite::Shipment.new :order_id => "o_id", :_id => "foo"
    shipment.refresh

#### Update

    shipment = # ... obtain a shipment
    shipment.metadata = {...}
    shipment.save

#### List

Accepts Filters.

    result = Airbrite::Shipment.list :order_id => "o_id"
    shipments = result.data
    paging = result.paging

### Customers

#### Create

    params = {...}
    customer = Airbrite::Customer.create params

    # or

    customer = Airbrite::Customer.new params
    customer.save

#### Retrieve

    customer = Airbrite::Customer.fetch :_id => "foo"

    # or

    customer = Airbrite::Customer.new :_id => "foo"
    customer.refresh

#### Update

    customer = # ... obtain a customer
    customer.metadata = {...}
    customer.save

#### List

Accepts Filters.

    result = Airbrite::Customer.list
    customers = result.data
    paging = result.paging

### Tax

#### Calculate

    tax = Airbrite::Tax.calculate :zip => "94301", :amount => 12345, :nexus_zips => "12345,67890"


### Account

#### Retrieve

    account = Airbrite::Account.fetch

### Event

#### Retrieve

    event = Airbrite::Event.fetch :_id => "foo"

    # or

    event = Airbrite::Event.new :_id => "foo"
    event.refresh

#### List

Accepts Filters.

    result = Airbrite::Event.list
    events = result.data
    paging = result.paging


### Filters

All list operations accept filters.  These are:

    [:limit, :skip, :sort, :order, :since, :until]

They work like so:

    events = Airbrite::Event.list(
      :limit => 50,
      :skip => 20,
      :sort => :created,
      :order => 1,
      :since => 24.hours.ago,
      :until => 12.hours.ago
    )

Anything you pass to `[:limit, :skip, :since, :until]` should play nicely with `to_i` (Time objects do). Anything passed to `:sort` should play nicely with `to_s` (symbols do).

You can mix and match them as you please.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
