
# Batch Retrieve Inventory Counts Request

## Structure

`Batch Retrieve Inventory Counts Request`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `catalog_object_ids` | `Array<String>` | Optional | The filter to return results by `CatalogObject` ID.<br>The filter is applicable only when set.  The default is null. |
| `location_ids` | `Array<String>` | Optional | The filter to return results by `Location` ID.<br>This filter is applicable only when set. The default is null. |
| `updated_after` | `String` | Optional | The filter to return results with their `calculated_at` value<br>after the given time as specified in an RFC 3339 timestamp.<br>The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`). |
| `cursor` | `String` | Optional | A pagination cursor returned by a previous call to this endpoint.<br>Provide this to retrieve the next set of results for the original query.<br><br>See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information. |
| `states` | [`Array<String (Inventory State)>`](../../doc/models/inventory-state.md) | Optional | The filter to return results by `InventoryState`. The filter is only applicable when set.<br>Ignored are untracked states of `NONE`, `SOLD`, and `UNLINKED_RETURN`.<br>The default is null. |

## Example (as JSON)

```json
{
  "catalog_object_ids": [
    "W62UWFY35CWMYGVWK6TWJDNI"
  ],
  "location_ids": [
    "59TNP9SA8VGDA"
  ],
  "updated_after": "2016-11-16T00:00:00.000Z"
}
```

