# Loyalty

```ruby
loyalty_api = client.loyalty
```

## Class Name

`LoyaltyApi`

## Methods

* [Create Loyalty Account](../../doc/api/loyalty.md#create-loyalty-account)
* [Search Loyalty Accounts](../../doc/api/loyalty.md#search-loyalty-accounts)
* [Retrieve Loyalty Account](../../doc/api/loyalty.md#retrieve-loyalty-account)
* [Accumulate Loyalty Points](../../doc/api/loyalty.md#accumulate-loyalty-points)
* [Adjust Loyalty Points](../../doc/api/loyalty.md#adjust-loyalty-points)
* [Search Loyalty Events](../../doc/api/loyalty.md#search-loyalty-events)
* [List Loyalty Programs](../../doc/api/loyalty.md#list-loyalty-programs)
* [Retrieve Loyalty Program](../../doc/api/loyalty.md#retrieve-loyalty-program)
* [Calculate Loyalty Points](../../doc/api/loyalty.md#calculate-loyalty-points)
* [Create Loyalty Reward](../../doc/api/loyalty.md#create-loyalty-reward)
* [Search Loyalty Rewards](../../doc/api/loyalty.md#search-loyalty-rewards)
* [Delete Loyalty Reward](../../doc/api/loyalty.md#delete-loyalty-reward)
* [Retrieve Loyalty Reward](../../doc/api/loyalty.md#retrieve-loyalty-reward)
* [Redeem Loyalty Reward](../../doc/api/loyalty.md#redeem-loyalty-reward)


# Create Loyalty Account

Creates a loyalty account. To create a loyalty account, you must provide the `program_id` and a `mapping` with the `phone_number` of the buyer.

```ruby
def create_loyalty_account(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Loyalty Account Request Hash`](../../doc/models/create-loyalty-account-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Loyalty Account Response Hash`](../../doc/models/create-loyalty-account-response.md)

## Example Usage

```ruby
body = {}
body[:loyalty_account] = {}
body[:loyalty_account][:id] = 'id2'
body[:loyalty_account][:program_id] = 'd619f755-2d17-41f3-990d-c04ecedd64dd'
body[:loyalty_account][:balance] = 14
body[:loyalty_account][:lifetime_points] = 38
body[:loyalty_account][:customer_id] = 'customer_id0'
body[:loyalty_account][:enrolled_at] = 'enrolled_at2'
body[:loyalty_account][:mapping] = {}
body[:loyalty_account][:mapping][:id] = 'id6'
body[:loyalty_account][:mapping][:created_at] = 'created_at4'
body[:loyalty_account][:mapping][:phone_number] = '+14155551234'
body[:idempotency_key] = 'ec78c477-b1c3-4899-a209-a4e71337c996'

result = loyalty_api.create_loyalty_account(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Loyalty Accounts

Searches for loyalty accounts in a loyalty program.

You can search for a loyalty account using the phone number or customer ID associated with the account. To return all loyalty accounts, specify an empty `query` object or omit it entirely.

Search results are sorted by `created_at` in ascending order.

```ruby
def search_loyalty_accounts(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Loyalty Accounts Request Hash`](../../doc/models/search-loyalty-accounts-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Loyalty Accounts Response Hash`](../../doc/models/search-loyalty-accounts-response.md)

## Example Usage

```ruby
body = {}
body[:query] = {}
body[:query][:mappings] = []


body[:query][:mappings][0] = {}
body[:query][:mappings][0][:id] = 'id4'
body[:query][:mappings][0][:created_at] = 'created_at8'
body[:query][:mappings][0][:phone_number] = '+14155551234'

body[:query][:customer_ids] = ['customer_ids5', 'customer_ids4']
body[:limit] = 10
body[:cursor] = 'cursor0'

result = loyalty_api.search_loyalty_accounts(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Loyalty Account

Retrieves a loyalty account.

```ruby
def retrieve_loyalty_account(account_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | The ID of the [loyalty account](../../doc/models/loyalty-account.md) to retrieve. |

## Response Type

[`Retrieve Loyalty Account Response Hash`](../../doc/models/retrieve-loyalty-account-response.md)

## Example Usage

```ruby
account_id = 'account_id2'

result = loyalty_api.retrieve_loyalty_account(account_id: account_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Accumulate Loyalty Points

Adds points to a loyalty account.

- If you are using the Orders API to manage orders, you only provide the `order_id`.
  The endpoint reads the order to compute points to add to the buyer's account.
- If you are not using the Orders API to manage orders,
  you first perform a client-side computation to compute the points.  
  For spend-based and visit-based programs, you can first call
  [CalculateLoyaltyPoints](../../doc/api/loyalty.md#calculate-loyalty-points) to compute the points  
  that you provide to this endpoint.

```ruby
def accumulate_loyalty_points(account_id:,
                              body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | The [loyalty account](../../doc/models/loyalty-account.md) ID to which to add the points. |
| `body` | [`Accumulate Loyalty Points Request Hash`](../../doc/models/accumulate-loyalty-points-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Accumulate Loyalty Points Response Hash`](../../doc/models/accumulate-loyalty-points-response.md)

## Example Usage

```ruby
account_id = 'account_id2'
body = {}
body[:accumulate_points] = {}
body[:accumulate_points][:loyalty_program_id] = 'loyalty_program_id8'
body[:accumulate_points][:points] = 90
body[:accumulate_points][:order_id] = 'RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY'
body[:idempotency_key] = '58b90739-c3e8-4b11-85f7-e636d48d72cb'
body[:location_id] = 'P034NEENMD09F'

result = loyalty_api.accumulate_loyalty_points(account_id: account_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Adjust Loyalty Points

Adds points to or subtracts points from a buyer's account.

Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call
[AccumulateLoyaltyPoints](../../doc/api/loyalty.md#accumulate-loyalty-points)
to add points when a buyer pays for the purchase.

```ruby
def adjust_loyalty_points(account_id:,
                          body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `account_id` | `String` | Template, Required | The ID of the [loyalty account](../../doc/models/loyalty-account.md) in which to adjust the points. |
| `body` | [`Adjust Loyalty Points Request Hash`](../../doc/models/adjust-loyalty-points-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Adjust Loyalty Points Response Hash`](../../doc/models/adjust-loyalty-points-response.md)

## Example Usage

```ruby
account_id = 'account_id2'
body = {}
body[:idempotency_key] = 'bc29a517-3dc9-450e-aa76-fae39ee849d1'
body[:adjust_points] = {}
body[:adjust_points][:loyalty_program_id] = 'loyalty_program_id4'
body[:adjust_points][:points] = 10
body[:adjust_points][:reason] = 'Complimentary points'

result = loyalty_api.adjust_loyalty_points(account_id: account_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Loyalty Events

Searches for loyalty events.

A Square loyalty program maintains a ledger of events that occur during the lifetime of a
buyer's loyalty account. Each change in the point balance
(for example, points earned, points redeemed, and points expired) is
recorded in the ledger. Using this endpoint, you can search the ledger for events.

Search results are sorted by `created_at` in descending order.

```ruby
def search_loyalty_events(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Loyalty Events Request Hash`](../../doc/models/search-loyalty-events-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Loyalty Events Response Hash`](../../doc/models/search-loyalty-events-response.md)

## Example Usage

```ruby
body = {}
body[:query] = {}
body[:query][:filter] = {}
body[:query][:filter][:loyalty_account_filter] = {}
body[:query][:filter][:loyalty_account_filter][:loyalty_account_id] = 'loyalty_account_id6'
body[:query][:filter][:type_filter] = {}
body[:query][:filter][:type_filter][:types] = ['DELETE_REWARD', 'ADJUST_POINTS', 'EXPIRE_POINTS']
body[:query][:filter][:date_time_filter] = {}
body[:query][:filter][:date_time_filter][:created_at] = {}
body[:query][:filter][:date_time_filter][:created_at][:start_at] = 'start_at8'
body[:query][:filter][:date_time_filter][:created_at][:end_at] = 'end_at4'
body[:query][:filter][:location_filter] = {}
body[:query][:filter][:location_filter][:location_ids] = ['location_ids2', 'location_ids3', 'location_ids4']
body[:query][:filter][:order_filter] = {}
body[:query][:filter][:order_filter][:order_id] = 'PyATxhYLfsMqpVkcKJITPydgEYfZY'
body[:limit] = 30
body[:cursor] = 'cursor0'

result = loyalty_api.search_loyalty_events(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# List Loyalty Programs

**This endpoint is deprecated.**

Returns a list of loyalty programs in the seller's account.
Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).

Replaced with [RetrieveLoyaltyProgram](../../doc/api/loyalty.md#retrieve-loyalty-program) when used with the keyword `main`.

```ruby
def list_loyalty_programs
```

## Response Type

[`List Loyalty Programs Response Hash`](../../doc/models/list-loyalty-programs-response.md)

## Example Usage

```ruby
result = loyalty_api.list_loyalty_programs()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Loyalty Program

Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`.

Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).

```ruby
def retrieve_loyalty_program(program_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `program_id` | `String` | Template, Required | The ID of the loyalty program or the keyword `main`. Either value can be used to retrieve the single loyalty program that belongs to the seller. |

## Response Type

[`Retrieve Loyalty Program Response Hash`](../../doc/models/retrieve-loyalty-program-response.md)

## Example Usage

```ruby
program_id = 'program_id0'

result = loyalty_api.retrieve_loyalty_program(program_id: program_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Calculate Loyalty Points

Calculates the points a purchase earns.

- If you are using the Orders API to manage orders, you provide the `order_id` in the request. The
  endpoint calculates the points by reading the order.
- If you are not using the Orders API to manage orders, you provide the purchase amount in
  the request for the endpoint to calculate the points.

An application might call this endpoint to show the points that a buyer can earn with the
specific purchase.

For spend-based and visit-based programs, the `tax_mode` setting of the accrual rule indicates how taxes should be treated for loyalty points accrual.

```ruby
def calculate_loyalty_points(program_id:,
                             body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `program_id` | `String` | Template, Required | The [loyalty program](../../doc/models/loyalty-program.md) ID, which defines the rules for accruing points. |
| `body` | [`Calculate Loyalty Points Request Hash`](../../doc/models/calculate-loyalty-points-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Calculate Loyalty Points Response Hash`](../../doc/models/calculate-loyalty-points-response.md)

## Example Usage

```ruby
program_id = 'program_id0'
body = {}
body[:order_id] = 'RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY'
body[:transaction_amount_money] = {}
body[:transaction_amount_money][:amount] = 72
body[:transaction_amount_money][:currency] = 'UZS'

result = loyalty_api.calculate_loyalty_points(program_id: program_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Loyalty Reward

Creates a loyalty reward. In the process, the endpoint does following:

- Uses the `reward_tier_id` in the request to determine the number of points
  to lock for this reward.
- If the request includes `order_id`, it adds the reward and related discount to the order.

After a reward is created, the points are locked and
not available for the buyer to redeem another reward.

```ruby
def create_loyalty_reward(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Loyalty Reward Request Hash`](../../doc/models/create-loyalty-reward-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Loyalty Reward Response Hash`](../../doc/models/create-loyalty-reward-response.md)

## Example Usage

```ruby
body = {}
body[:reward] = {}
body[:reward][:id] = 'id4'
body[:reward][:status] = 'REDEEMED'
body[:reward][:loyalty_account_id] = '5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd'
body[:reward][:reward_tier_id] = 'e1b39225-9da5-43d1-a5db-782cdd8ad94f'
body[:reward][:points] = 230
body[:reward][:order_id] = 'RFZfrdtm3mhO1oGzf5Cx7fEMsmGZY'
body[:reward][:created_at] = 'created_at2'
body[:idempotency_key] = '18c2e5ea-a620-4b1f-ad60-7b167285e451'

result = loyalty_api.create_loyalty_reward(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Search Loyalty Rewards

Searches for loyalty rewards. This endpoint accepts a request with no query filters and returns results for all loyalty accounts.
If you include a `query` object, `loyalty_account_id` is required and `status` is  optional.

If you know a reward ID, use the
[RetrieveLoyaltyReward](../../doc/api/loyalty.md#retrieve-loyalty-reward) endpoint.

Search results are sorted by `updated_at` in descending order.

```ruby
def search_loyalty_rewards(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Search Loyalty Rewards Request Hash`](../../doc/models/search-loyalty-rewards-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Search Loyalty Rewards Response Hash`](../../doc/models/search-loyalty-rewards-response.md)

## Example Usage

```ruby
body = {}
body[:query] = {}
body[:query][:loyalty_account_id] = '5adcb100-07f1-4ee7-b8c6-6bb9ebc474bd'
body[:query][:status] = 'REDEEMED'
body[:limit] = 10
body[:cursor] = 'cursor0'

result = loyalty_api.search_loyalty_rewards(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Delete Loyalty Reward

Deletes a loyalty reward by doing the following:

- Returns the loyalty points back to the loyalty account.
- If an order ID was specified when the reward was created
  (see [CreateLoyaltyReward](../../doc/api/loyalty.md#create-loyalty-reward)),
  it updates the order by removing the reward and related
  discounts.

You cannot delete a reward that has reached the terminal state (REDEEMED).

```ruby
def delete_loyalty_reward(reward_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `reward_id` | `String` | Template, Required | The ID of the [loyalty reward](../../doc/models/loyalty-reward.md) to delete. |

## Response Type

[`Delete Loyalty Reward Response Hash`](../../doc/models/delete-loyalty-reward-response.md)

## Example Usage

```ruby
reward_id = 'reward_id4'

result = loyalty_api.delete_loyalty_reward(reward_id: reward_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Loyalty Reward

Retrieves a loyalty reward.

```ruby
def retrieve_loyalty_reward(reward_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `reward_id` | `String` | Template, Required | The ID of the [loyalty reward](../../doc/models/loyalty-reward.md) to retrieve. |

## Response Type

[`Retrieve Loyalty Reward Response Hash`](../../doc/models/retrieve-loyalty-reward-response.md)

## Example Usage

```ruby
reward_id = 'reward_id4'

result = loyalty_api.retrieve_loyalty_reward(reward_id: reward_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Redeem Loyalty Reward

Redeems a loyalty reward.

The endpoint sets the reward to the `REDEEMED` terminal state.

If you are using your own order processing system (not using the
Orders API), you call this endpoint after the buyer paid for the
purchase.

After the reward reaches the terminal state, it cannot be deleted.
In other words, points used for the reward cannot be returned
to the account.

```ruby
def redeem_loyalty_reward(reward_id:,
                          body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `reward_id` | `String` | Template, Required | The ID of the [loyalty reward](../../doc/models/loyalty-reward.md) to redeem. |
| `body` | [`Redeem Loyalty Reward Request Hash`](../../doc/models/redeem-loyalty-reward-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Redeem Loyalty Reward Response Hash`](../../doc/models/redeem-loyalty-reward-response.md)

## Example Usage

```ruby
reward_id = 'reward_id4'
body = {}
body[:idempotency_key] = '98adc7f7-6963-473b-b29c-f3c9cdd7d994'
body[:location_id] = 'P034NEENMD09F'

result = loyalty_api.redeem_loyalty_reward(reward_id: reward_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

