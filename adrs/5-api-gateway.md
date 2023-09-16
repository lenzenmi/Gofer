
# 5. api gateway
======

Date: 16-09-2023 11:57:40

## Status
======

Proposed

## Context
======

* We are choosing to build our product with a small development team initially 
* Should we achieve market success, we would like the flexibility to reorganize our backend services without impacting current users

## Decision
======

We will only allow access to our backend services through the Azure API Management Service

## Consequences
======

Pros
* Basic Ddos protection
* We have a seam where we can reorganize backend details without impacting clients
* We can easily implement rate limits in the future
* We can easily enforce only TLS connections
* We can centralize TLS certificate management
* We can centralize Auth termination simplifying the design of our services

Cons
* Additional Hosting costs
* Additional configuration and maintenance costs
* Reduced performance due to an additional layer of proxy
* Potential headaches if we try to implement long polling or large payloads due to included Ddos protection

