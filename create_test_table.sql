CREATE TABLE project_id.dataset_id.raw_events (
    event_id STRING,
    event_type STRING,
    timestamp TIMESTAMP,
    user_id STRING,
    payment_amount FLOAT64,
    payment_method STRING,
    device_id STRING,
    event_properties ARRAY<STRUCT<key STRING, value STRING>>
)
PARTITION BY DATE(timestamp);

INSERT INTO project_id.dataset_id.raw_events (
    event_id,
    event_type,
    timestamp,
    user_id,
    payment_amount,
    payment_method,
    device_id,
    event_properties
)
VALUES
    ('1', 'purchase', TIMESTAMP '2024-03-14 12:00:00', 'user123', 20.50, 'Credit Card', 'device123', NULL),
    ('2', 'subscription', TIMESTAMP '2024-03-14 12:15:00', 'user456', 15.00, 'PayPal', 'device456', ARRAY<STRUCT<key STRING, value STRING>> [('property1', 'value1'), ('property2', 'value2')]),
    ('3', 'purchase', TIMESTAMP '2024-03-14 12:30:00', 'user789', 10.75, NULL, 'device789', NULL),
    ('4', 'purchase', TIMESTAMP '2024-03-14 12:45:00', 'user_id123', NULL, 'payment_method', 'device_id', NULL),
    ('5', '', TIMESTAMP '2024-03-14 12:45:00',NULL, NULL, 'payment_method', 'device_id', NULL);
    -- Add more rows as needed
    -- Example: ('4', 'event_type', TIMESTAMP '2024-03-14 12:45:00', 'user_id', NULL, 'payment_method', 'device_id', NULL, 'country', 'city', 'browser', 'os'),
    -- Adjust values to match your data and schema requirements
    -- Ensure some values are set to NULL to demonstrate handling of null values
