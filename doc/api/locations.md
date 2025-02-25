# Locations

```ruby
locations_api = client.locations
```

## Class Name

`LocationsApi`

## Methods

* [List Locations](../../doc/api/locations.md#list-locations)
* [Create Location](../../doc/api/locations.md#create-location)
* [Retrieve Location](../../doc/api/locations.md#retrieve-location)
* [Update Location](../../doc/api/locations.md#update-location)


# List Locations

Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api),
including those with an inactive status.

```ruby
def list_locations
```

## Response Type

[`List Locations Response Hash`](../../doc/models/list-locations-response.md)

## Example Usage

```ruby
result = locations_api.list_locations()

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Create Location

Creates a [location](https://developer.squareup.com/docs/locations-api).
Creating new locations allows for separate configuration of receipt layouts, item prices,
and sales reports. Developers can use locations to separate sales activity through applications
that integrate with Square from sales activity elsewhere in a seller's account.
Locations created programmatically with the Locations API last forever and
are visible to the seller for their own management. Therefore, ensure that
each location has a sensible and unique name.

```ruby
def create_location(body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `body` | [`Create Location Request Hash`](../../doc/models/create-location-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Create Location Response Hash`](../../doc/models/create-location-response.md)

## Example Usage

```ruby
body = {}
body[:location] = {}
body[:location][:id] = 'id0'
body[:location][:name] = 'Midtown'
body[:location][:address] = {}
body[:location][:address][:address_line_1] = '1234 Peachtree St. NE'
body[:location][:address][:address_line_2] = 'address_line_26'
body[:location][:address][:address_line_3] = 'address_line_32'
body[:location][:address][:locality] = 'Atlanta'
body[:location][:address][:sublocality] = 'sublocality6'
body[:location][:address][:administrative_district_level_1] = 'GA'
body[:location][:address][:postal_code] = '30309'
body[:location][:timezone] = 'timezone0'
body[:location][:capabilities] = ['AUTOMATIC_TRANSFERS', 'CREDIT_CARD_PROCESSING', 'AUTOMATIC_TRANSFERS']
body[:location][:description] = 'Midtown Atlanta store'

result = locations_api.create_location(body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Retrieve Location

Retrieves details of a single location. Specify "main"
as the location ID to retrieve details of the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).

```ruby
def retrieve_location(location_id:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to retrieve. Specify the string<br>"main" to return the main location. |

## Response Type

[`Retrieve Location Response Hash`](../../doc/models/retrieve-location-response.md)

## Example Usage

```ruby
location_id = 'location_id4'

result = locations_api.retrieve_location(location_id: location_id)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```


# Update Location

Updates a [location](https://developer.squareup.com/docs/locations-api).

```ruby
def update_location(location_id:,
                    body:)
```

## Parameters

| Parameter | Type | Tags | Description |
|  --- | --- | --- | --- |
| `location_id` | `String` | Template, Required | The ID of the location to update. |
| `body` | [`Update Location Request Hash`](../../doc/models/update-location-request.md) | Body, Required | An object containing the fields to POST for the request.<br><br>See the corresponding object definition for field details. |

## Response Type

[`Update Location Response Hash`](../../doc/models/update-location-response.md)

## Example Usage

```ruby
location_id = 'location_id4'
body = {}
body[:location] = {}
body[:location][:id] = 'id0'
body[:location][:name] = 'name0'
body[:location][:address] = {}
body[:location][:address][:address_line_1] = 'address_line_16'
body[:location][:address][:address_line_2] = 'address_line_26'
body[:location][:address][:address_line_3] = 'address_line_32'
body[:location][:address][:locality] = 'locality6'
body[:location][:address][:sublocality] = 'sublocality6'
body[:location][:timezone] = 'timezone0'
body[:location][:capabilities] = ['AUTOMATIC_TRANSFERS', 'CREDIT_CARD_PROCESSING', 'AUTOMATIC_TRANSFERS']
body[:location][:business_hours] = {}
body[:location][:business_hours][:periods] = []


body[:location][:business_hours][:periods][0] = {}
body[:location][:business_hours][:periods][0][:day_of_week] = 'FRI'
body[:location][:business_hours][:periods][0][:start_local_time] = '07:00'
body[:location][:business_hours][:periods][0][:end_local_time] = '18:00'

body[:location][:business_hours][:periods][1] = {}
body[:location][:business_hours][:periods][1][:day_of_week] = 'SAT'
body[:location][:business_hours][:periods][1][:start_local_time] = '07:00'
body[:location][:business_hours][:periods][1][:end_local_time] = '18:00'

body[:location][:business_hours][:periods][2] = {}
body[:location][:business_hours][:periods][2][:day_of_week] = 'SUN'
body[:location][:business_hours][:periods][2][:start_local_time] = '09:00'
body[:location][:business_hours][:periods][2][:end_local_time] = '15:00'

body[:location][:description] = 'Midtown Atlanta store - Open weekends'

result = locations_api.update_location(location_id: location_id, body: body)

if result.success?
  puts result.data
elsif result.error?
  warn result.errors
end
```

