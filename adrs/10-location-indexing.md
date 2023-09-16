
# 10. location indexing
======

Date: 16-09-2023 12:50:57

## Status
======

Proposed

## Context
======

* Drivers will need to lookup orders at their current location
* Orders are expected to be updated infrequently with pickup and drop off coordinates being static for the duration of the order

## Decision
======

We will utilize built-in Database GeoSpatial indexes to query orders by pickup location


## Consequences
======

Pros
* No need to add a specialized component to handle location indexes

Cons
* If we later wish to index fast moving data, for example "find a driver near a location" we will likely run into performance problems and need to look at a different solution
