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

## Engineering Levels

* [SoundCloud](https://developers.soundcloud.com/blog/engineering-levels)

### Level 1

| Results / Delivery | Behavior / Mindset | Tech skills / Mastery | Influence / Visibility | Communication / Collaboration |
| --- | --- | --- | --- | --- |
| Collaborates with team members | Has a positive attitude; raises constructive improvement ideas instead of complaining | Competent in primary tech stack | Publicly attempts to engage in knowledge sharing, even if unpolished (e.g. demos)	 | Keeps the team up to date on personal progress |
| Asks questions to clarify estimations (acceptance criteria, KPIs)	 | Shares the SoundCloud values	 | Confident with computer science basics (algorithms, data structures, complexity, design patterns) | Participates in tech discussions	 | Asks for help when stuck |
| Is able to deliver small stories | Constantly looks for opportunities to develop their skills	 | Is productive with basic tools (git, favorite editor, etc.) | | Communicates constructively, positively, honestly, and sensitively |
| Integrates contributions as early as possible (no long-lived changes in branches)	 | Seeks to take on more responsibility	 | Learns new technologies quickly | | Takes feedback positively |
| | Is flexible and open to change | Can contribute to an existing framework	 | | Engages in team meetings |
| | Keeps the build green	 | Adheres to test coverage standards	 | | |
| | Helps where possible | Regularly applies learnings from past experiences	 | | |
| | Celebrates with the team	 |  | | |
| | Is curious and asks questions |  | | |



### Level 2

| Results / Delivery | Behavior / Mindset | Tech skills / Mastery | Influence / Visibility | Communication / Collaboration |
| --- | --- | --- | --- | --- |
| Drives simple epics (an iteration long) |	Holds themself and the team accountable for removing delivery blockers (e.g. green build) |	Is competent to proficient in the primary technology of the team |	Helps others with pair programming and doing code reviews |	Helps the team stay focused |
| Understands tradeoffs to deliver (MVP mindset) |	Thinks critically and makes informed decisions based on first principles |	Makes informed decisions about which tools and algorithms to use for specific problems |	Comments on RFCs and epic briefs where the team is a stakeholder |	Can explain and advocate for a certain decision/solution |
| Provides reliable story estimates and breaks up the bigger ones |	Learns from failure: admits mistakes and shares learnings |	Demonstrates competent problem solving skills (debugging, analysis, instrumentation) |	Can onboard new team members - has a basic understanding of all projects and operations of the team |	Can represent the team (questions, meetings) |
| Is actively involved in the development process end to end |	Aware of and actively works on their gaps in relevant tech skills |	Keeps availability and robustness in mind day to day |	Suggests process improvements (active in retrospective meetings) |	Listens to others and shows empathy - accepts different perspectives |
| Finishes or hands off work before leaving for a planned absence |	Selects tasks based on team priorities (not selective/picky) |	Complies to local coding guidelines and writes code that others understand |	Networks outside of the company (e.g. going to conferences/meetups) |	Gives constructive feedback regularly |
| Keeps track of tech or conceptual debt |	Proactively picks up things without an owner |	Makes architecture decisions within a system/module/service |	Understands the importance of and participates in the hiring process |	Actively asks for feedback and acts on it |
| Identifies risks in a project |	Refers to goals and metrics in team discussions |	Actively builds up knowledge of neighboring systems	| |	Actively contributes to team meetings |
| | Involves all stakeholders in refining a project's requirements |	Understands tradeoffs between testing approaches	| |	Manages conflicts and is comfortable with being direct |

### Level 3

| Results / Delivery | Behavior / Mindset | Tech skills / Mastery | Influence / Visibility | Communication / Collaboration |
| --- | --- | --- | --- | --- |
| Drives larger projects reliably by delegating and coordinating |	Keeps the team honest and accountable to commitments |	Designs larger systems that are easy for new employees to understand and change or remove |	Mentors other engineers (pair programming, code reviews, feedback) |	Collaborates across multiple teams/functions |
| Splits larger projects into smaller parts effectively |	Encourages team members to deliver with high quality |	Owns and drives technical guidelines |	Proactively increases visibility of their team's work |	Facilitates technical decision-making in the team |
| Provides multiple solution proposals with different costs | Proactively improves the tools the team is working with |	Go-to person for the primary technology of the team |	Identifies if currently used technologies are appropriate |	Contributes to the technical vision of the team |
| Identifies and manages risks on the team |	Cares about a specific system/service/component - acts as an owner without being possessive |	Is competent in diverse technologies |	Discovers organizational inefficiencies and proposes changes |	Writes RFCs and epic briefs and follows up on the comments |
| Gives reasonable estimates for larger projects |	Proactively supports positive culture by confronting negative behavior - leading by example |	Demonstrates proficient problem-solving skills (debugging, analysis, instrumentation) |	Actively seeks out potential candidates when the team wants to grow |	When communicating, makes sure messages have arrived and been understood |
| Coordinates work across team boundaries |	Shows empathy for other teams |	Understands the implications of a decision for other teams/services/components |	Writes blog posts or talks at conferences - has external influence |	Participates in broad architectural conversations |
| Plans all aspects of a project (testing/monitoring/alerting) |	Constantly puts effort into understanding the business/product big picture |	Constantly puts effort into understanding the company-wide architecture |	Informs "build or buy" decisions |	Serves as a team representative in cross-team meetings and initiatives | 
| Manages time well and takes on more responsibilities without negatively affecting team output |	Regularly assesses security and legal risks | |	Enables people around them to be more effective	| |

### Level 4

| Results / Delivery | Behavior / Mindset | Tech skills / Mastery | Influence / Visibility | Communication / Collaboration |
| --- | --- | --- | --- | --- |
| Is a tech consultant for major product ideas |	Identifies and addresses company-wide gaps in skills/delivery/strategy |	Is an expert specialist or proficient generalist |	Works on tech strategy/vision for a functional area |	Proactively builds up relationships with stakeholders |
| Drives long-term, large-scale, cross-team projects |	Understands the industry - knows peer companies and their business - and uses this in strategic decision making |	Considers engineering as a whole by making the right tradeoffs (security, performance, maintainability, availability, cost)	Enables teams around them to be more effective |	Acts as a tie breaker in technical discussions. | Can resolve conflict and put personal opinion aside. |
| Coordinates work across a functional area |	Understands the company KPIs and different revenue streams and the business in general |	Is well informed about technical solutions peer companies use |	Acts as a technical consultant to other teams |	Facilitates effective meetings across a functional area |
| Identifies and manages risks for an area/cluster |	Regularly zooms out and thinks outside their expertise/area |	Knows the software technology trends and shares them internally |	Is visible internally; the engineering leadership team is aware of their work |	Actively reaches out to and builds network with industry leaders |
| Manages external tech vendors/partners |	Improves tools and development processes for an area/cluster | |	Is known in the community and called in to present externally	| |
| Refers to return on investment in prioritization discussions | | | Researches and evaluates new technologies that can influence an area/cluster	| |
| | | | Creates content/framework for learning | |
| | | | Leads cross-cutting "build or buy" decisions | |

### Level 5

| Results / Delivery | Behavior / Mindset | Tech skills / Mastery | Influence / Visibility | Communication / Collaboration |
| --- | --- | --- | --- | --- |
| Enables/leads company-wide projects that positively affect all areas |	Is a role model for company values |	Can ask difficult questions in all technologies	| Sets/directs technical strategy |	Represents the engineering org across all business functions |
| Delivers foundational/critical systems to the business |	Leads by example to establish new cultural norms | Creates and leads org-wide guidelines |	Creates new business opportunities for the company  |	Facilitates tech vision discussions for the entire engineering org | 
| Identifies, promotes, and delivers competitive differentiation for the engineering organization |	Balances and is aware of technical and non-technical sides to company-wide challenges |	Constantly works on understanding all technologies used at the company |	Seeks out, recruits, and grows other level 4/5 leaders |	Inspires while communicating - motivates others to follow them through their leadership |
| Looks at org-wide cycle time/risk when evaluating/building technical solutions |	Develops new company-wide processes	Has experience in scaling up a system through multiple stages of growth |	Is known as a leader in the industry (e.g. invited to conferences as a keynote speaker or a domain expert) |	Can act as the external face of the company for engineers |
| Is a decision maker on major technology topics (e.g. deprecating a tech stack, acquisitions, strategy, etc.) | |	Is a world-renowned expert in a relevant domain	| Has written a book or major article on relevant technical topics	| |
| | | Evaluates and brings in new technologies/tools used across the company |	Uses their leadership platform to promote and hire for diversity | |
