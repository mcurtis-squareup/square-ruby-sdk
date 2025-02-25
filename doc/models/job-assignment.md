
# Job Assignment

An object describing a job that a team member is assigned to.

## Structure

`Job Assignment`

## Fields

| Name | Type | Tags | Description |
|  --- | --- | --- | --- |
| `job_title` | `String` | Required | The title of the job.<br>**Constraints**: *Minimum Length*: `1` |
| `pay_type` | [`String (Job Assignment Pay Type)`](../../doc/models/job-assignment-pay-type.md) | Required | Enumerates the possible pay types that a job can be assigned. |
| `hourly_rate` | [`Money Hash`](../../doc/models/money.md) | Optional | Represents an amount of money. `Money` fields can be signed or unsigned.<br>Fields that do not explicitly define whether they are signed or unsigned are<br>considered unsigned and can only hold positive amounts. For signed fields, the<br>sign of the value indicates the purpose of the money transfer. See<br>[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)<br>for more information. |
| `annual_rate` | [`Money Hash`](../../doc/models/money.md) | Optional | Represents an amount of money. `Money` fields can be signed or unsigned.<br>Fields that do not explicitly define whether they are signed or unsigned are<br>considered unsigned and can only hold positive amounts. For signed fields, the<br>sign of the value indicates the purpose of the money transfer. See<br>[Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts)<br>for more information. |
| `weekly_hours` | `Integer` | Optional | The planned hours per week for the job. Set if the job `PayType` is `SALARY`. |

## Example (as JSON)

```json
{
  "job_title": "job_title4",
  "pay_type": "NONE",
  "hourly_rate": {
    "amount": 172,
    "currency": "TJS"
  },
  "annual_rate": {
    "amount": 232,
    "currency": "TOP"
  },
  "weekly_hours": 156
}
```

