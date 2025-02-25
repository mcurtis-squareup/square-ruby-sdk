# Terminal

```ruby
terminal_api = client.terminal
```

## Class Name

`TerminalApi`

## Methods

* [Create Terminal Checkout](../../doc/api/terminal.md#create-terminal-checkout)
* [Search Terminal Checkouts](../../doc/api/terminal.md#search-terminal-checkouts)
* [Get Terminal Checkout](../../doc/api/terminal.md#get-terminal-checkout)
* [Cancel Terminal Checkout](../../doc/api/terminal.md#cancel-terminal-checkout)
* [Create Terminal Refund](../../doc/api/terminal.md#create-terminal-refund)
* [Search Terminal Refunds](../../doc/api/terminal.md#search-terminal-refunds)
* [Get Terminal Refund](../../doc/api/terminal.md#get-terminal-refund)
* [Cancel Terminal Refund](../../doc/api/terminal.md#cancel-terminal-refund)


# Create Terminal Checkout

Creates a Terminal checkout request and sends it to the specified device to take a payment
for the requested amount.

```ruby
def create_terminal_checkout(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Terminal Checkout Request Hash`](../../doc/models/create-terminal-checkout-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Terminal Checkout Response Hash`](../../doc/models/create-terminal-checkout-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = '28a0c3bc-7839-11ea-bc55-0242ac130003'
body[:checkout] = {}
body[:checkout][:id] = 'id8'
body[:checkout][:amount_money] = {}
body[:checkout][:amount_money][:amount] = 2610
body[:checkout][:amount_money][:currency] = 'USD'
body[:checkout][:reference_id] = 'id11572'
body[:checkout][:note] = 'A brief note'
body[:checkout][:device_options] = {}
body[:checkout][:device_options][:device_id] = 'dbb5d83a-7838-11ea-bc55-0242ac130003'
body[:checkout][:device_options][:skip_receipt_screen] = false
body[:checkout][:device_options][:collect_signature] = false
body[:checkout][:device_options][:tip_settings] = {}
body[:checkout][:device_options][:tip_settings][:allow_tipping] = false
body[:checkout][:device_options][:tip_settings][:separate_tip_screen] = false
body[:checkout][:device_options][:tip_settings][:custom_tip_field] = false
body[:checkout][:device_options][:tip_settings][:tip_percentages] = [148, 149, 150]
body[:checkout][:device_options][:tip_settings][:smart_tipping] = false
body[:checkout][:deadline_duration] = 'deadline_duration0'
body[:checkout][:status] = 'status0'

result = terminal_api.create_terminal_checkout(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Terminal Checkouts

Returns a filtered list of Terminal checkout requests created by the application making the request. Only Terminal checkout requests created for the merchant scoped to the OAuth token are returned. Terminal checkout requests are available for 30 days.

```ruby
def search_terminal_checkouts(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Terminal Checkouts Request Hash`](../../doc/models/search-terminal-checkouts-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Terminal Checkouts Response Hash`](../../doc/models/search-terminal-checkouts-response.md)

## Example Usage

```ruby
body = {}
body[:query] = {}
body[:query][:filter] = {}
body[:query][:filter][:device_id] = 'device_id8'
body[:query][:filter][:created_at] = {}
body[:query][:filter][:created_at][:start_at] = 'start_at2'
body[:query][:filter][:created_at][:end_at] = 'end_at0'
body[:query][:filter][:status] = 'COMPLETED'
body[:query][:sort] = {}
body[:query][:sort][:sort_order] = 'DESC'
body[:cursor] = 'cursor0'
body[:limit] = 2

result = terminal_api.search_terminal_checkouts(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Get Terminal Checkout

Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout requests are available for 30 days.

```ruby
def get_terminal_checkout(checkout_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `checkout_id` | `String` | Template, Required | The unique ID for the desired `TerminalCheckout`. |

## Response Type

[`Get Terminal Checkout Response Hash`](../../doc/models/get-terminal-checkout-response.md)

## Example Usage

```ruby
checkout_id = 'checkout_id8'

result = terminal_api.get_terminal_checkout(checkout_id: checkout_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Cancel Terminal Checkout

Cancels a Terminal checkout request if the status of the request permits it.

```ruby
def cancel_terminal_checkout(checkout_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `checkout_id` | `String` | Template, Required | The unique ID for the desired `TerminalCheckout`. |

## Response Type

[`Cancel Terminal Checkout Response Hash`](../../doc/models/cancel-terminal-checkout-response.md)

## Example Usage

```ruby
checkout_id = 'checkout_id8'

result = terminal_api.cancel_terminal_checkout(checkout_id: checkout_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Terminal Refund

Creates a request to refund an Interac payment completed on a Square Terminal. Refunds for Interac payments on a Square Terminal are supported only for Interac debit cards in Canada. Other refunds for Terminal payments should use the Refunds API. For more information, see [Refunds API](../../doc/api/refunds.md).

```ruby
def create_terminal_refund(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Terminal Refund Request Hash`](../../doc/models/create-terminal-refund-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Terminal Refund Response Hash`](../../doc/models/create-terminal-refund-response.md)

## Example Usage

```ruby
body = {}
body[:idempotency_key] = '402a640b-b26f-401f-b406-46f839590c04'
body[:refund] = {}
body[:refund][:id] = 'id4'
body[:refund][:refund_id] = 'refund_id8'
body[:refund][:payment_id] = '5O5OvgkcNUhl7JBuINflcjKqUzXZY'
body[:refund][:order_id] = 'order_id8'
body[:refund][:amount_money] = {}
body[:refund][:amount_money][:amount] = 111
body[:refund][:amount_money][:currency] = 'CAD'
body[:refund][:reason] = 'Returning items'
body[:refund][:device_id] = 'f72dfb8e-4d65-4e56-aade-ec3fb8d33291'
body[:refund][:deadline_duration] = 'deadline_duration6'
body[:refund][:status] = 'status6'

result = terminal_api.create_terminal_refund(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Terminal Refunds

Retrieves a filtered list of Interac Terminal refund requests created by the seller making the request. Terminal refund requests are available for 30 days.

```ruby
def search_terminal_refunds(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Terminal Refunds Request Hash`](../../doc/models/search-terminal-refunds-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Terminal Refunds Response Hash`](../../doc/models/search-terminal-refunds-response.md)

## Example Usage

```ruby
body = {}
body[:query] = {}
body[:query][:filter] = {}
body[:query][:filter][:device_id] = 'device_id8'
body[:query][:filter][:created_at] = {}
body[:query][:filter][:created_at][:start_at] = 'start_at2'
body[:query][:filter][:created_at][:end_at] = 'end_at0'
body[:query][:filter][:status] = 'COMPLETED'
body[:query][:sort] = {}
body[:query][:sort][:sort_order] = 'sort_order8'
body[:cursor] = 'cursor0'
body[:limit] = 1

result = terminal_api.search_terminal_refunds(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Get Terminal Refund

Retrieves an Interac Terminal refund object by ID. Terminal refund objects are available for 30 days.

```ruby
def get_terminal_refund(terminal_refund_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `terminal_refund_id` | `String` | Template, Required | The unique ID for the desired `TerminalRefund`. |

## Response Type

[`Get Terminal Refund Response Hash`](../../doc/models/get-terminal-refund-response.md)

## Example Usage

```ruby
terminal_refund_id = 'terminal_refund_id0'

result = terminal_api.get_terminal_refund(terminal_refund_id: terminal_refund_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Cancel Terminal Refund

Cancels an Interac Terminal refund request by refund request ID if the status of the request permits it.

```ruby
def cancel_terminal_refund(terminal_refund_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `terminal_refund_id` | `String` | Template, Required | The unique ID for the desired `TerminalRefund`. |

## Response Type

[`Cancel Terminal Refund Response Hash`](../../doc/models/cancel-terminal-refund-response.md)

## Example Usage

```ruby
terminal_refund_id = 'terminal_refund_id0'

result = terminal_api.cancel_terminal_refund(terminal_refund_id: terminal_refund_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

