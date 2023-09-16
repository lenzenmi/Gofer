
# 6. backend messaging
======

Date: 16-09-2023 12:06:17

## Status
======

Proposed

## Context
======

* We have some asynchronous work to process payments
* We have a relatively small number of use cases in our proof of concept system
* We have a small development team without capacity to monitor and react to problems
* The Kafka API requires an expensive premium SKU from Azure Event Hubs

## Decision
======

We will utilize Azure Event Hubs (Kafka) as our backend queue. We will utilize the microsoft event hubs client for JavaScript instead of the open Kafka clients

## Consequences
======

Pros
* If there transient issues when handling messages, we will retry indefinitely and gracefully resume processing when the transient issue is resolved without the need for developer intervention
* Bugs in handling code will be caught early as processing will be halted
* Managed service requires fewer developers to operate

Cons
* Not cloud portable (proprietary API)
* Monitoring can be difficult