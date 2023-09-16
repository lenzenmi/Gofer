
# 1. mobile app stack
======

Date: 16-09-2023 11:16:19

## Status
======

Proposed

## Context
======

* Still proving the concept of gofer and want to get something out fast
* The current app design has a very small UI footprint
* The current app design has very limited interaction with hardware and native APIs (camera and location)
* In the current job market, it is more difficult to hire developers experienced in Android and iOS compared to React and TypeScript


## Decision
======

We choose React Native for our mobile app stack

## Consequences
======

Pros:
* Will be able to target iOS and Android with a single codebase
* Expected to be easier to hire a few developers familiar with React than to hire developers familiar with iOS and Android
* Expected that fewer overall developers will be required to realize the mobile app proof of concept

Cons:
* App experience will not conform to native design guides, may turn some users off
* App performance will likely be slower than a native solution
* Future requirements to integrate specific external libraries or platform specific APIs
could be much more difficult to develop and maintain


