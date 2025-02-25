# Customer Segments

```ruby
customer_segments_api = client.customer_segments
```

## Class Name

`CustomerSegmentsApi`

## Methods

* [List Customer Segments](../../doc/api/customer-segments.md#list-customer-segments)
* [Retrieve Customer Segment](../../doc/api/customer-segments.md#retrieve-customer-segment)


# List Customer Segments

Retrieves the list of customer segments of a business.

```ruby
def list_customer_segments(cursor: nil,
                           limit: nil)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `cursor` | `String` | Query, Optional | A pagination cursor returned by previous calls to `ListCustomerSegments`.<br>This cursor is used to retrieve the next set of query results.<br><br>For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |
| `limit` | `Integer` | Query, Optional | The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results.<br>If the specified limit is less than 1 or greater than 50, Square returns a `400 VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 50.<br><br>For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). |

## Response Type

[`List Customer Segments Response Hash`](../../doc/models/list-customer-segments-response.md)

## Example Usage

```ruby
cursor = 'cursor6'
limit = 172

result = customer_segments_api.list_customer_segments(cursor: cursor, limit: limit)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Customer Segment

Retrieves a specific customer segment as identified by the `segment_id` value.

```ruby
def retrieve_customer_segment(segment_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `segment_id` | `String` | Template, Required | The Square-issued ID of the customer segment. |

## Response Type

[`Retrieve Customer Segment Response Hash`](../../doc/models/retrieve-customer-segment-response.md)

## Example Usage

```ruby
segment_id = 'segment_id4'

result = customer_segments_api.retrieve_customer_segment(segment_id: segment_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

