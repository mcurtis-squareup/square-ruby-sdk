
# Standard Unit Description

Contains the name and abbreviation for standard measurement unit.

## Structure

`Standard Unit Description`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `unit` | [`Measurement Unit Hash`](../../doc/models/measurement-unit.md) | Optional | Represents a unit of measurement to use with a quantity, such as ounces<br>or inches. Exactly one of the following fields are required: `custom_unit`,<br>`area_unit`, `length_unit`, `volume_unit`, and `weight_unit`. |
| `name` | `String` | Optional | UI display name of the measurement unit. For example, 'Pound'. |
| `abbreviation` | `String` | Optional | UI display abbreviation for the measurement unit. For example, 'lb'. |

## Example (as JSON)

```json
{
  "unit": {
    "custom_unit": {
      "name": "name0",
      "abbreviation": "abbreviation2"
    },
    "area_unit": "IMPERIAL_ACRE",
    "length_unit": "IMPERIAL_INCH",
    "volume_unit": "METRIC_MILLILITER",
    "weight_unit": "IMPERIAL_STONE"
  },
  "name": "name0",
  "abbreviation": "abbreviation2"
}
```

