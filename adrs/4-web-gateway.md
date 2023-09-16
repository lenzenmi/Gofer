
# 4. web gateway
======

Date: 16-09-2023 11:51:04

## Status
======

Proposed

## Context
======

* We have chosen to use a single page application for our website which will make several calls to our backend services
* The web application consists of static content that needs to be served to our clients

## Decision
======

We will utilize Azure Front Door as a web gateway

## Consequences
======

Pros
* We can host our assets and backend requests at the same domain address. This allows us to avoid the overhead of CORS
* Assets will be cached in the CDN and served quickly
* We have a proxy seam that can be used to restructure our backend without impacting our frontend
* Basic ddos protection will be provided

Cons
* We will need a cache-busting strategy to ensure deployments can be updated
* Requests will be proxied degrading performance slightly
* Additional cost of operation and setup
* Configuration headaches may arise if we try to implement long-polling, or large payloads
