
# Order Line Item Pricing Blocklists

Describes pricing adjustments that are blocked from manual and
automatic application to a line item. For more information, see
[Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).

## Structure

`Order Line Item Pricing Blocklists`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `blocked_discounts` | [`Array<Order Line Item Pricing Blocklists Blocked Discount Hash>`](../../doc/models/order-line-item-pricing-blocklists-blocked-discount.md) | Optional | A list of discounts blocked from applying to the line item.<br>Discounts can be blocked by the `discount_uid` (for ad hoc discounts) or<br>the `discount_catalog_object_id` (for catalog discounts). |
| `blocked_taxes` | [`Array<Order Line Item Pricing Blocklists Blocked Tax Hash>`](../../doc/models/order-line-item-pricing-blocklists-blocked-tax.md) | Optional | A list of taxes blocked from applying to the line item.<br>Taxes can be blocked by the `tax_uid` (for ad hoc taxes) or<br>the `tax_catalog_object_id` (for catalog taxes). |

## Example (as JSON)

```json
{
  "blocked_discounts": [
    {
      "uid": "uid5",
      "discount_uid": "discount_uid1",
      "discount_catalog_object_id": "discount_catalog_object_id7"
    }
  ],
  "blocked_taxes": [
    {
      "uid": "uid7",
      "tax_uid": "tax_uid3",
      "tax_catalog_object_id": "tax_catalog_object_id1"
    }
  ]
}
```

