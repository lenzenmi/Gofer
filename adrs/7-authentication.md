
# 7. authentication
======

Date: 16-09-2023 12:14:57

## Status
======

Proposed

## Context
======

* We would like to make it easy for the general public to sign up and use our service

* Our users are not our employees and we do not wish to manage their permissions within our system

## Decision
======

We will utilize 3rd party SSO providers like Google for authentication

Internally we will use JWT to transmit user account information and capabilities from client to service

## Consequences
======

Pros
* No central point of failure 
* No shared session state required which will make scaling horizontally more effective
* As we are choosing to utilize APIM, authentication can be handled in a central place

Cons
* Integrating with an SSO provider can be more difficult than providing basic session based auth
* Revoking permissions or deactivating accounts takes time


