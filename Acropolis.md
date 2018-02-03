# Acropolis

* https://github.com/bbcarchdev/acropolis

# Introduction

Acropolis is a toolkit for building and maintaining knowledge graphs. The Acropolis stack powers the BBC's Research & Education Space and Datalab projects.

## Research & Education Space

* https://bbcarchdev.github.io/res/
* https://acropolis.org.uk/

RES's purpose is to construct a knowledgebase of Linked Open Data, a reasonable amount of which (thanks in part to our intervention) ought to concern or relate to creative works with associated accessible (subject to licensing/access controls) media assets which may be presented in a variety of ways, and in doing so always represent the origins of the data and ensure where possible that applications can retrieve it, both because RES won't always retain the finer (domain-specific) detail, and because RES doesn't claim to be authoritative.

## Datalab

* https://twitter.com/bbcdatalab
* https://github.com/bbc/datalab-recruitment

# Components

## [m4](https://github.com/bbcarchdev/m4)

Build system support macros

## [liburi](https://github.com/bbcarchdev/liburi)

URI parsing and manipulation library

## [libawsclient](https://github.com/bbcarchdev/libawsclient)

Client access library for services speaking AWS protocols

## [libsparqlclient](https://github.com/bbcarchdev/libsparqlclient)

Client access library for SPARQL-savvy graph stores

## [libsql](https://github.com/bbcarchdev/libsql)

Client access library for SQL databases

## [libcluster](https://github.com/bbcarchdev/libcluster)

Self-balancing cluster library

* Add support for https://github.com/i-scream/libstatgrab?

## [libsupport](https://github.com/bbcarchdev/libsupport)

Should be renamed to `libappconfig` and have logging elements removed (replaced with [`liblogging`](https://github.com/rsyslog/liblogging))

## [Anansi](https://github.com/bbcarchdev/anansi)

Web crawler

## [Twine](https://github.com/bbcarchdev/twine)

RDF-oriented workflow processing server

## [Quilt](https://github.com/bbcarchdev/quilt)

Linked Data server

* Support `GET` requests including a structured request payload? (JSON?)
  * Can this be implemented without breaking caching? Is there a `Vary: body`?
  * More trouble than it's worth?
  * Should be a `POST`? But then breaks semantics?
* Other HTTP methods should be at least _handled_; it should then be up to the engine to decide what to do.
  * e.g., [Patchwork](#patchwork) could accept S/MIME-signed `PUT` requests to enqueue graphs for processing?
* Configurable routing (e.g., send different URI patterns to different engines)
  * Incoming URI and query-parameter transformation
  * It should be straightforward to implement this with neglible loss of efficiency

## [Spindle](https://github.com/bbcarchdev/spindle)

Knowledge-base processing engine for [Twine](#twine)

## [Patchwork](https://github.com/bbcarchdev/patchwork)

Knowledge-base server engine for [Quilt](#quilt)

* Add support for multiple `?uri=URI` query-parameters, return a single RDF doc containing all of the requested entities.
  * Add a configurable soft-limit for the number of URIs which will be processed in a single query
