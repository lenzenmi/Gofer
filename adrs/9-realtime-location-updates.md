
# 9. realtime location updates
======

Date: 16-09-2023 12:42:05

## Status
======

Proposed

## Context
======

* Users will need to receive real time updates of a driver's location to make delivery a good experience
* Drivers will want an audit log to prove they made the delivery if the user does not mark the delivery as complete
* 


## Decision
======

* The mobile App will regularly send gps coordinates along with the orders once they have accepted an order
* The web app will query the most recent coordinate of the driver delivering their order through the web api at regular intervals
* A log of driver coordinates and timestamps will be retrievable by the dispute manager

## Consequences
======

Pros
* Not necessary to introduce more complicated real-time architecture like websockets and deal with related problems like handling a large number of open connections

Cons
* Will generate a large amount of coordinate data which will need to be managed in the future

