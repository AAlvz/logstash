---

REAL TIME DATA MONITORING
=========================

Goals
------------

Implement Real Time Data Monitoring (Open Source) into ABP infrastructure as
a mechanism of improval in development, data analysis, and resolution
in buisness related questions to benify the user and the working
processes and prodictivity.

________________________________________________________________


The goals will take place in different stages.
  Steps.
   1. Configure the environment to start capturing and proccessing log files.
   2. Create filters to anylize the proccessed data according
      to the current EyeO goals.
   3. Establish a way to visualize and manipulate the data that is friendly to
      every area in the company.
   4. Further monitoring. (More servers, Trac, IRC, and so ...)

________________________________________________________________

Motivation & Benefits  - Why?
-----------------------------

   Better:
      - Insight
      - Transparency
      - Trustability
      - Accuracy in interpretation of data
      - Analytics
      - Response to Failures.
      - Feedback
      - Consistency
      - Centralized logs

  - Faster Reaction
  - Improve Media time to Repair (MTTR)
  - Collect, Parse, Store.
  - Current active users.
  - Lead to Continuous Improvement.

  Facilitate:
     - Statistics
     - Debbugging
     - Data Access & Manipulation (Data proccesing returns JSON)
     - Choices [Buisness | Development]
     - Debugging (on the fly)
     - Search of information (of processes data)

What will be tested? What do I want to find out?
--------------------

In this approach it's possible to see what's going on live.
Filters can be applied any time and get graphics of any data and therefore
get results valuable and understandable for any department or area of the Co.


Possible Future Work
--------------------

   - Gather data to automate different processes.
   - Monitoring TRAC issues to:
      - Find bottlenecks.
      - WIP
      - Average times in issues.
      - [Old | Blocking] issues.
      - Areas of improvement.

______________________________________________________________


Acceptance Criteria for goal reach
----------------------------------

A succes would mean that:

   - Live tracking and proccessing of data is available.
   - Results of processed data can be visualized to satisfy
     development and business inquiries.

How?
----

  The full implementation is known as [ELK](http://www.elasticsearch.org/overview/) (open soruce)

  - **Elasticsearch** is a search and analytics engine.
     Thanks to it almost any action can be performed using
     a simple **RESTful API** using JSON over HTTP. It is easy to **scale**
     it supports **advanced search features** and [indexing](http://lucene.apache.org/core/)
  - **Logstash** will be used to parse and enrich the data.
  - **Kibana** is the elasticsearch visualization engine.
     It allows dynamic interaction with the data

_________________________________________________________


Resources. What do I need to accomplish the goal?
-------------------------------------------------

  - Time
  - Production server
  - Test server
  - Support
    (Kirill is supporting already to tackle this the best as possible)

Also would help:

  - Elasticsearch meetup 12th of January in Cologne.
  - Elasticsearch conferences in Germany in January

What else can be logged:

  - Emails
  - AdBlockings. Was it effective? How does it impact traffic?
  - Server performance (loads)
