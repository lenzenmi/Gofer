
# 3. service stack
======

Date: 16-09-2023 11:37:44

## Status
======

Proposed

## Context
======

* We have already chosen TypeScript as the language for our mobile and web stacks
* NodeJs and Espresso is a popular web server framework
* A review of libraries and support indicated that the needed clients exist:
  * Database connectors
  * Websockets
  * GRPC / ProtoBuf
  * Azure app service hosting
* We want to move quickly to establish a proof of concept

## Decision
======

* adopt Espresso/NodeJs/TypeScript as the backend stack

## Consequences
======

Pros
* Can build features with less communication overhead and as a result rework by taking a full-stack approach.
* Can more effectively utilize resources by moving them between products as needed

Cons
* NodeJs has been less stable over time compared to other stacks such as C#. Expect a higher level of maintenance overhead
* Single threaded deployments can make compute resource utilization difficult. Expect higher operating costs than other solutions
* Less efficient of a programming language than other choices. If the service work proves to be complicated, it may take more time and be more difficult to implement when compared to other technology stacks
