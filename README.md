## Tea Time ##
Tea Time is a take-home back-end application that exposes an API to support the user-facing application which allows customers to subscribe to tea subscriptions. This API will allow front-end developers to display customer subscriptions, cancel subscriptions, and create customer subscriptions.

### Prerequisites ###
- Rails 5.2.6
- Ruby 2.7.2

### Installation ###
1. Fork & clone this repo.
2. Run `bundle install` to install gem packages.
3. Run `rails db:{drop,create,migrate}` to set up the database.
4. To consume Tea Time endpoints locally, run `rails s` and navigate to `localhost:3000`

### Schema ###
![Tea Time Schema](./downloads/Tea_Time_Schema.png)

### Endpoints ###

*Notes:*

*Status for events are defined as `enum : {"Active" => 0, "Cancelled" => 1}`. The default status is 0. Either the string or the integer may be used when referring to categories.*

**Subscriptions**
  
Request GET `/api/v1/customer/:customer_id/subscriptions` to return all customer subscriptions. 
Accepts no query params.

Sample Response:

```
{
    "type": "subscription",
    "data": [
        {
            "id": 1,
            "title": "Tea Monthly",
            "price": 52,
            "status": "Cancelled",
            "frequency": "Monthly"
        },
        {
            "id": 2,
            "title": "Tea weekly",
            "price": 46,
            "status": "Cancelled",
            "frequency": "Weekly"
        },
        {
            "id": 3,
            "title": "Tea Monthly",
            "price": 54,
            "status": "Cancelled",
            "frequency": "Monthly"
        },
        {
            "id": 4,
            "title": "Tea Monthly",
            "price": 52,
            "status": "Active",
            "frequency": "Monthly"
        }
    ]
}
```
Request Post `/api/v1/customer/:customer_id/subscriptions` to create a new customer subscription
Query params: `?title=Tea Monthly&price=52&frequency=Monthly`

Returns the created customer subscription.

Sample Body:

```
{
    "type": "subscription",
    "data": [
        {
            "id": 5,
            "title": "Tea Monthly",
            "price": 52,
            "status": "Active",
            "frequency": "Monthly"
        }
    ]
}

```
Request Patch `/api/v1/customer/:customer_id/subscriptions/:id` to update a new customer subscription from `Active` to `Cancelled`

Returns the updated customer subscription. The subscription status is changed from `Active` to `Cancelled`.
Accepts no query params.

Sample Body:
```
{
    "type": "subscription",
    "data": [
        {
            "id": 3,
            "title": "Tea Monthly",
            "price": 54,
            "status": "Cancelled",
            "frequency": "Monthly"
        }
    ]
}
```

### Contacts ###
- Ted Staros      |  [Github](https://github.com/tstaros23)   |   [LinkedIn](https://www.linkedin.com/in/ted-staros/)
