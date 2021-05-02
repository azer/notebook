# Rethinking modern web browsers

**The browser wars ended**.

After two decades of platform-intensive competition, the winner of the war, Chrome, shifted its their strategy prioritize **security over product innovation**. This makes sense, Chrome wants to **dominate the whole internet**; and as it gets more successful on this, the cost of maintaining an extension marketplace **multiples**, in contrast to the percentage of users using the marketplace **shrink**. The party is over. And it’ll stay as it is, elaborated more in the [Market](#market) chapter of this document.

This trend is generating frustration for a particular audience: power users; people who access information, tools for communication and productivity using web browsers on daily basis. Their **work** happens inside the web browser, and it’s important to **utilize** their web browser in ways it makes them more efficient, more focused, less distracted. This user group chooses the best tools that gets them top productivity in general, and the major web browsers target too broad to satisfy them.

This web browser project aims to be **tailored for power users**. It **rethinks** web browser from scratch, tackles decades old decisions that became "standard" almost (e.g tabbing), provides better **opinionated defaults** and **builtin features**. It's being designed and built end-to-end for giving power users more **productive**, **secure** and **private** web browsing experience.


**Index of contents:**

* [Product Focus](#product-focus)
  * [Productivity](#productivity)
  * [Privacy](#privacy)
  * [Security](#security)
  * [Search](#search)
  * [See it in action](#see-it-in-action)
* [Market](#market)
  * [The Terrible Idea](#the-terrible-idea)
  * [The Bloody Market](#the-bloody-market)
  * [The Fragile Giant](#the-fragile-giant)
  * [The Opportunity](#the-opportunity)
  * [The Audience](#the-audience)
* [Strategy](#strategy)
  * [Previous Strategy (Failure)](#previous-strategy-failure)
  * [Next Strategy](#next-strategy)
  * [Growth](#growth)
      * [A. Search](#a-search)
      * [B. Privacy](#b-privacy)
      * [C. Parental Controls](#c-parental-controls)
      * [D. Reading](#d-reading)
      * [E. Security](#e-security)
      * [F. Search + Privacy + Search](#f-search--privacy--security)
* [Revenue](#revenue)
  * [Model 1. Subscription](#model-1-subscription)
  * [Model 2. Issuing Verification](#model-2-issuing-verification)
  * [Model 3. Micropayments](#model-3-micropayments)
  * [Model 4. Delay](#model-4-delay)
* [Historical Context](#historical-context)
* [Status](#status)
* [Feedback is love ❤️](#feedback-is-love-%EF%B8%8F)

# Product Focus

> In a world deluged by irrelevant information, clarity is power.
― Y. N. Harari


## Productivity

The general approach is to;

* Remove tabbing bar
* Reduce dependency on search engines (more on [Security](#security))
* Provide high-quality, builtin features designed for powerusers, replacing low-quality extensions

### Redesigning tabbing bar

The horizontal tabbing bar was designed for the internet 30 years ago, and hasn't changed since then. Here are some problems with modern tabbing:

* It requires manual management
* Default order is by date and time the tab is opened
* Multitasking and distraction is promoted, instead of focus, clarity and context

**Change 1. No tabbing bar**

Show user only what's relevant to their context by default, nothing else.

![](https://github.com/azer/fathomecat/blob/main/screencasts/screenshot.png?raw=true)

**Change 2. Dropdown tabbing**

* Open up a rich address menu with tabs, bookmarks and history
* Sort them based on their relevancy to the context, instead of date & time they were opened at
* Automatically manage them, instead of manual
* The dropdown shows a menu for each tab, on the right.

An example use-case: user is shopping children books on Amazon. The dropdown tabbing menu listed by their relevancy to the book.

| Chrome | This Project |
| --- | --- |
| ![](https://github.com/azer/fathomecat/blob/main/screencasts/chrome%20-%20comparable%20view.png?raw=true) | ![](https://raw.githubusercontent.com/azer/fathomecat/main/screencasts/tabbing%20view%20-%20amazon.png) |

Check out [See it in action](#see-it-in-action) for a video.

### Commands

The dropdown shell makes it possible to offer users not just searching the tabs but actually anything. For instance, if user enters "weather", she could be suggested to open weather.com, and also be simply provided weather.

Commands in order:

* search
* open website
* jump to tab
* calculator
* dictionary (define)
* pronounce
* timezone math
* what's my ip
* conversions

### Note taking

User could just enter normal text in the query bar and as soon as the word count passes X, the view could be changed into note taking.

### Password Management

Password management can be achived with no storage by choosing a secret key, similar to how Bitcoin works. A web browser could have been built on top of this foundation.

- Inspiration: [Lesspass](https://lesspass.com)

## Security

Web browsers delegate even the simpliest search functionalities to default search engines, as a part of their business model. This creates a giant security hole in the middle of two perfectly secure products:

* User enters "wells fargo" into their web browser
* They expect to just open the wells fargo website but the browser takes them to a search engine returning 29 million results for it
* User unconsciously knows that they need to click the first result
* Attacker also knows that users will click the first result: they create a phishing site for wells fargo and give google ads for the keyword.

To address this issue, web browsers need a new "data backend" to help following features implemented:

* Autocomplete the user input to a url, even if there is typos (e.g "welsfargo" -> "https://wellsfargo.com")
* Show verification icon next to the website names on top of the web browser.

![](https://cldup.com/x4jKv2UaMv.png)

## Privacy

A user logged into their company's Gmail account is also logged into Google (search), Chrome (web browser) and Youtube at same time. The browser offers an incognito mode, in a separate window.

Instead of a new separate window, we could offer users enabling two "modes" per website:

* **Private Mode:** Keeps the site data (cookies etc) in a private partition, so the site can't profile you.
* **90s Mode:** Turns off some milennium technology we can live without (e.g JavaScript) so you get true 90s experience on the selected website. Works really nice.

Check it out in the gifcast below:

![](https://github.com/azer/fathomecat/blob/main/screencasts/private-90s-mode.gif?raw=true)

## Search

Major web browsers are profitable by delegating search all together. At this point, let's look at the use cases of a search engine:

* Converting a human friendly input to a url ("welsfargo" -> "wellsfargo.com")
* Find a content you already know ("coursera music theory")
* Answering an actual question ("what's the weather like?")
* Document search ("music theory" -> 9 million results about music theory)

The first version of this web browser will cover only the first use case, understanding human inputs and taking the user directly to the website without involving any third party search engine.

In other words, a user entering "basecamp" will not be taken in to a page full of advertise given by Basecamp competitors, and 4 million search results. A user entering "basecamp" to the address bar will be taken to "basecamp.com" directly, leveraging the dataset embedded into the browser itself.

This will be done within the browser itself in the first stages of the company, and evolve into its own platform tackling more search problems in the future. See [Strategy](#strategy) section for more.

Data sources:

* [Alexa 1m Sites](http://s3.amazonaws.com/alexa-static/top-1m.csv.zip)
* [Tranco List](https://tranco-list.eu/)
* [Parsed Dmoz Data / Harvard Dataverse](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/OMV93V)
* Wikipedia
  * [Websites by topic](https://en.wikipedia.org/wiki/Category:Websites_by_topic)
  * [Application Software](https://en.wikipedia.org/wiki/Category:Application_software)
   * [Online services](https://en.wikipedia.org/wiki/Category:Online_services)
* [g2](https://g2.com/products/coursera)

## See it in action

![](https://github.com/azer/fathomecat/blob/main/screencasts/browsing-800.gif?raw=true)

# Market

> He who is not busy being born is busy dying.
― Bob Dylan

## The Terrible Idea

It can easily sound like a **terrible idea** to build a web browser, given;

* They have been free since the time Microsoft distributed IE with Windows.
* It takes an army of engineers to build the web browser's rendering engine.
* Google dominates the market from both browser and search engine sides.
* A giant like Mozilla barely manages to survive.

## The Bloody Market

The **status quo** does look like a bloody market, and it is understandable why we ended at this point:

* Maintaining different rendering engines for each new web browser caused **Diseconomies of Scale**. Each engine had to meet individually the rapidly inflated specifications for a number of standards.
* Mozilla directed its resources on perfecting their **platform, not the product**.
* Product problems were delegated to extension market place, highly insecure and inefficient.
* Google interpreted the user patterns perfectly and converted them to simple & high impact products / features on great timing.
* Google leveraged Apple's rendering engine to build its own browser, prioritizing that its search engine would be **the default interface of the internet**. This has been a huge success for Google.

## The Fragile Giant

While Google has been enjoying its huge success in such a way discouraging anybody who would attempt to compete with them, is it really **that strong?**

* No new product will beat Google by competing with it, by doing what it does in a similar way.
* Google's fragility is at its core.
  * Its web browser must target millions of people, from a tour guide in Eastern Sahara desert to a startup founder in LA.
  * Its web browser must be designed so that someone typing "basecamp" in their address bar should see a full page of ads, instead of the browser having the user open the Basecamp product without any friction. This is a **misaligned incentive** that directly affects Google's revenue.
  * Chrome's marketplace was very promising at the beginning, but the party is over for the developers. Google shifted to security-first policy and implemented really aggressive bots to delete extensions unless their authors are willing to fight back periodically.
  * This shift also makes sense for Google as the web browser is just an interface to the search engine for them. It doesn't really have to statisfy the needs of the power users.
  * This positioning keeps Google away from a competition targeting special group of users, as their mission is to be a generic interface for internet, not a specifically good one.
  * This positioning also keeps Google away from a competition for web browsers embedding search engine features and making them better for users. Firefox is also in the same position, as its revenue is based on sending users to Google, as well.

## The Opportunity

* **The browser wars** ended. Google won it with its pragmatism. Microsoft and Mozilla lost.
* Microsoft now uses Blink, Google's fork of Apple's Webkit. Brave uses Chromium.
* All major desktop web browsers also have somewhat similar architectures and interfaces; their objective is to be generic, not specific.
* This leaves room for a new web browser **creating its own category** with fresh perspective, being **great for a specific audience**, instead of **generic & mediocre for all**.
* The **late mover advantage** is to build a web browser that concentrates its resources into the product itself, rather than what major web browser did: rendering engines.
* Being specific will allow us to **undo high-level, decades old product decisions**, remove **unconscious frictions** and offer better ones.
* Dominating a specific audience in the web browser market will also open the gate to other opportunities, such as expanding on the search direction.

## The Audience

* Sources to identify:
  * User research executed in 2021
  * YC Hackathon
* Following user groups favored "yes" answer for the question **would you pay for this web browser?**
  * **startup founders** with technical background
  * **senior software engineers**
  * **top performers**
* **User acquisition** in this audience is really straightforward, as they're **proactively seeking** alternatives.
* A **confirmation** is how the prototype of this project [reached over 400 stars](https://github.com/fathomecat/fathomecat) with zero marketing efforts (not even a link-share in social media).
* In my **direct conversations**, I increasingly heard people from this audience *proactively* telling me **I'd pay for a better web browser**

# Strategy

## Previous Strategy (Failure)

In the last attempt, I was quickly allured by search problems and dropped ball on working on the browser itself. I stopped working on the browser and instead doubled-down building the platform that would empower the search engine.

That was a mistake and quickly led me to failure for the following reasons;

* It was really hard to acquire users for this data collection platform in contrast to the web browser
* To acquire users, I had to build too many irrelevant features to grow my dataset (bookmarks)
* The acquired users weren't interested in the overall direction

## Next Strategy

* Get into the market as a web browser for power users, promoting its new design.
* Build a private beta group with early adapters who are in alignment with the product vision.
* Build a great initial product. See the [Product Focus](#product-focus) for the scope.
* Reach 1000 customers who love the product.
* Reach 1000 customers who would be highly disappointed without it.

## Growth

Below list shows what growth paths I project at this moment:

#### A. Search

Extracting its embedded search functionality into its own dedicated and more sophisticated external platform that will tackle more search problems, with the objective of becoming a new search engine that beats Google in quality, not in quantity, by providing:

* A trust index for URLs
* A name (speed dial / keyword) index for URLs
* A popularity (site / content / relevancy) index
* A quality index (in later stages)
* Personal and social relevancy index (in later stages)

#### B. Privacy

* Encrypted storage for personal browsing history
* Full text search via the address bar

#### C. Parental Controls

* Offer a family account for users
* Include parental settings that helps parents to manage their access to web safely

#### D. Reading

* Offer a reading mode enabled by default, that resembles Kindle.
* Offer better lookup features to dictionaries and wikipedia summaries, also resembling Kindle.
* Offer an alternative to archive.org, that keeps track of all articles but without their layout / formatting.

#### E. Security

* Extract web browser's "verification check" into its own service available for public.
* Build a team that issues verification checks for websites
* Charge website owners for the verification check issuing process

#### F. Search + Privacy + Security

Combines the previously mentioned growth paths;

* Provide an encrypted storage service for user's history and other personal data.
* Build a search service that extracts metadata (content + keywords) for any given url, disconnected from the storage service keeping personal data.
* Same search service would issue verification checks for websites.
* Sync the service data to web browser's local database, which enables next:
* Provide personalized, local search engine for users, that will let them depend on external search engines even less.

# Revenue

Below lists the potential ways of monetization.

#### Model 1. Subscription

* Audience: people willing to pay for more productivity and focus on context, less distractions and multitasking.
* Value proposition: measure how much time the browser saves, compare the monthly subscription cost with ( saved hours * the hourly rate of the user ).
* Role model: Superhuman

Potential iterations:

* Hosting of the browser history safely in an encrypted store & sync'ing that automatically

#### Model 2. Issuing Verification

* At the beginning, a dataset distributed with the runtime will display whether if a website is "verified".
* In the future, this can be extracted into its own platform and done by a team.
* This can be priced per verification and become a de-facto standard for every new website.
* See [Security](#security) for the product plan for introducing a verification check.
* See [Strategy](#strategy) for the the evolution from the embedded dataset to an external platform.

#### Model 3. Micropayments

* Introduce a standard for sending payments to any web address (blog, news, youtube video, or even a tweet)
* Based on the attention paid into certain content, send a share of the subscription cost of the user to the content owner.

#### Model 4. Delay

* Stay free and focus on growth of the users.
* Follow the [F. Search + Privacy + Search](#f-search--privacy--security) strategy for growth.
* Monetize the search with ads.

# Historical Context

Historically, following attemps got me unique learnings about the challenges and opportunities of building web browsers;

* 2011 - [Delicious Surf](http://github.com/azer/delicious-surf): Browser for old the bookmarking service del.icio.us. Linux only.
* 2013 - Gezi Web Browser: YCombinator Hackathon Finalist
* 2016 - Jelly Web Browser: Internal project at Jelly.
* 2016 - [Kaktus Web Browser](https://github.com/kaktus/kaktus): A prototype for experimenting with the product ideas I had. Gained traction among developers.
* 2017 - [Kozmos](https://kodfabrik.com/journal/rethinking-web-browsers-and-bookmarking): A search product (powered by bookmarking) with Chrome extension implementing some of the product ideas listed here for Google Chrome as an extension.

# Status

* An early proof of concept of this browser [is available in Github](https://github.com/kaktus/kaktus).
* This early proof gained traction among developers with no marketing efforts. See [Strategy](#strategy) for details.

# Feedback is love ❤️

* You can help me by sharing your feedback.
* [Feedback form ⛳](https://6h6z9t0tz4e.typeform.com/to/vo8tNOyp)
