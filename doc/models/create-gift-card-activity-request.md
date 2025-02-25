
# Create Gift Card Activity Request

A request to create a gift card activity.

## Structure

`Create Gift Card Activity Request`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `idempotency_key` | `String` | Required | A unique string that identifies the `CreateGiftCardActivity` request.<br>**Constraints**: *Minimum Length*: `1`, *Maximum Length*: `128` |
| `gift_card_activity` | [`Gift Card Activity Hash`](../../doc/models/gift-card-activity.md) | Required | Represents an action performed on a gift card that affects its state or balance. |

## Example (as JSON)

```json
{
  "gift_card_activity": {
    "activate_activity_details": {
      "line_item_uid": "eIWl7X0nMuO9Ewbh0ChIx",
      "order_id": "jJNGHm4gLI6XkFbwtiSLqK72KkAZY"
    },
    "gift_card_id": "gftc:6d55a72470d940c6ba09c0ab8ad08d20",
    "location_id": "81FN9BNFZTKS4",
    "type": "ACTIVATE"
  },
  "idempotency_key": "U16kfr-kA70er-q4Rsym-7U7NnY"
}
```

