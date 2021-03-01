# Management

## Measures

Source: [Harry Dean Hudson](https://www.contentful.com/blog/2020/10/06/implementing-four-key-metrics-contentful/)

#### Lead time 

Lead time is a traditional development and production metric which measures the time it takes something to enter the production process to the moment it reaches customers in the market. The challenge with lead time is that it has been overused to the point of where most folks using the term are likely talking about different things. The definition used in Accelerate is (thankfully) more specific. In the context of the book and this post, lead time refers to the time period between a code being committed to when that code is delivered into production.

#### Deployment frequency 

This is probably the most straightforward metric, but is also a metric whose value is commonly challenged by both executives and developers. But the correlation is very clear — teams who deploy to production more frequently (multiple times per day) are more likely to fall into the high- or elite-performing category. 

#### Change fail rate 

How often do changes deployed to production fail? This metric was the hardest to define and measure practically, but from a high level it indicates the efficacy of your quality-control process. How many changes introduce major bugs or regressions in your production environment?

#### Mean-Time-To-Restore (MTTR) 

The average time it takes to recover from a service outage, failed deploy, or incident, Mean-Time-To-Restore (MTTR) is a great operational metric because beyond pure availability metrics (which are also critical), it measures a kind of resilience in the face of failures.
