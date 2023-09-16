
# 8. backend hosting
======

Date: 16-09-2023 12:20:21

## Status
======

Proposed

## Context
======

* We have a small development team without the ability to monitor and support a large amount of infrastructure
* We have a single monolith application which consists of a web api and a background worker

## Decision
======

Utilize Azure Web App

## Consequences
======

Pros
* Easy to setup and monitor
* Centralized logging
* Basic performance metrics
* Easy to scale out
* Analytics are easy to enable for more advanced Closed Box Telemetry
* Can host background worker and website in the same compute unit
* Simple unified deployment of website and background worker

Cons
* Cannot scale background worker independent of website
* Background work can interfere with website performance
* If more services are crated, cost efficiency is much lower than other tools like k8s
* Much harder to implement complex deployment patterns than other solutions
