# Rethinking modern web browsers

The major web browsers have achieved great improvements on their **platform problems**, while delegating all the **product problems** to third party extensions. This strategy scaled somewhat well for the last two decades, but now we're seeing the limitations; security is increasingly becoming a priority over innovation driven by browser extensions.

This trend has been generating frustration for people who use desktop web browsers as their main interface to access information, communicate, be productive. I believe there is an opportunity for **a new web browser specifically tailored for power users**,  which prioritizes **product problems** over platform problems, comes with **opinionated defaults** and **builtin features** for helping power users to utilize their web browser for more productivity, security, privacy, and gradually search.

Index of contents:

* [Product Focus](#product-focus)
  * [Productivity](#productivity)
  * [Privacy](#privacy)
  * [Security](#security)
  * [Search](#search)
  * [See it in action](#see-it-in-action)
* [Market](#market)
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
* [Historical Context](#historical-context)
* [Status](#status)

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

![](https://raw.githubusercontent.com/azer/fathomecat/main/screencasts/tabbing%20view%20-%20amazon.png)

Check out [See it in action](#see-it-in-action) for a video.

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

## See it in action

![](https://github.com/azer/fathomecat/blob/main/screencasts/browsing-800.gif?raw=true)

# Market

> He who is not busy being born is busy dying.
― Bob Dylan

It can easily sound like a **terrible idea** to build a web browser, given;

* They have been free since the time Microsoft distributed IE with Windows.
* It takes an army of engineers to build the web browser's rendering engine.
* Google dominates the market from both browser and search engine sides.
* A giant like Mozilla barely manages to survive.

The **status quo** does look like a bloody market, and it is understandable why we ended at this point:

* Maintaining different rendering engines for each new web browser caused **Diseconomies of Scale**. Each engine had to meet individually the rapidly inflated specifications for a number of standards.
* Mozilla directed its resources on perfecting their **platform, not the product**.
* Product problems were delegated to extension market place, highly insecure and inefficient.
* Google interpreted the user patterns perfectly and converted them to simple & high impact products / features on great timing.
* Google leveraged Apple's rendering engine to build its own browser, prioritizing that its search engine would be **the default interface of the internet**. This has been a huge success for Google.

While Google has been enjoying its huge success in such a way discouraging anybody who would attempt to compete with them, is it really **that strong?**

* No new product will beat Google by competing with it, by doing what it does in a similar way.
* Google's fragility is at its core.
  * Its web browser must target millions of people, from a tour guide in Eastern Sahara desert to a startup founder in LA.
  * Its web browser must be designed so that someone typing "basecamp" in their address bar should see a full page of ads, instead of the browser having the user open the Basecamp product without any friction. This is a **misaligned incentive** that directly affects Google's revenue.
  * Chrome's marketplace was very promising at the beginning, but the party is over for the developers. Google shifted to security-first policy and implemented really aggressive bots to delete extensions unless their authors are willing to fight back periodically.
  * This shift also makes sense for Google as the web browser is just an interface to the search engine for them. It doesn't really have to statisfy the needs of the power users.
  * This positioning keeps Google away from a competition targeting special group of users. Google will not be able to undo dozens of high-level decisions made several decades ago which doesn't make any sense for some of us today.
  * This positioning also keeps Google away from a competition to make users need search engines *less*. Firefox is also in the same position, as its revenue is based on sending users to Google, as well.
* Apart from Google, there is a potential trend to build web browsers targeting privacy specifically. As I've described earlier in the [Security](#security) section, it's hard to claim to be a privacy-friendly web browser or a privacy-friendly search engine without looking at the holistic user story end-to-end.


Where does this project stand in the market?

* Platform parts of web browsers are becoming more and more unified. Microsoft now uses Blink, Google's fork of Apple's Webkit.
* The **late mover advantage** we have today is to build a web browser that concentrates its resources into the product itself, rather than what major web browser did: rendering engines.
* This product will **undo high-level, decades old product decisions**, remove **unconscious frictions** and offer better ones in the desktop browser market.
* The target user group is people willing to pay for being more productive, doing more with their time, and being free from distractions, benefiting from more focus and clarity, rather than being exposed to multitasking by design.
* **Superhuman** can be a role model for this; if a tool tailored for saving you X minutes every day, summing up to hours in weeks, why not to pay for $Y to save $Z ?
* Additional to **saved hours** and **refined attention** values users would get are increased, end-to-end security and privacy.

# Strategy

## Previous Strategy (Failure)

In the last attempt, I was quickly allured by search problems and dropped ball on working on the browser itself. While there was traction and interest in using the web browser MVP I released, I stopped working on the browser and instead started building the platform that would empower the search engine.

That was a mistake and quickly led me to failure for the following reasons;
* It was really hard to acquire users for this data collection platform in contrast to the web browser
* To acquire users, I had to build too many irrelevant features to grow my dataset (bookmarks)
* The acquired users weren't interested in the overall direction

## Next Strategy

* Build a great initial product. See [Product Focus](#product-focus) for the scope. 
* Embed a tiny search engine to enable [productivity](#productivity) and [security](#security) features.
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
* Build a search service that extracts metadata for any given url, disconnected from the storage service.
* Same search service would issue verification checks for websites.
* Sync the service data to web browser's local database, which enables next:
* Provide personalized, local search engine for users, that will let them depend on external search engines even less.

# Historical Context

Historically, following attemps got me unique learnings about the challenges and opportunities of building web browsers;

* 2011 - [Delicious Surf](http://github.com/azer/delicious-surf): Browser for old the bookmarking service del.icio.us. Linux only.
* 2013 - Gezi Web Browser: YC Hackathon Finalist
* 2016 - Jelly Web Browser: Internal project at Jelly.
* 2016 - [Kaktus Web Browser](https://github.com/kaktus/kaktus): A prototype for experimenting with the product ideas I had. Gained traction among developers.
* 2017 - [Kozmos](https://kodfabrik.com/journal/rethinking-web-browsers-and-bookmarking): A search product (powered by bookmarking) with Chrome extension implementing some of the product ideas listed here for Google Chrome as an extension.

# Status

* An early proof of concept of this browser [is available in Github](https://github.com/kaktus/kaktus).
* This early proof gained traction among developers with no marketing efforts. See [Strategy](#strategy) for details.
* I see two paths ahead:
  * A. Self-funding it first and acquiring customers before raising funds
  * B. Finding an angel investor in my network who wants to help me get this going
  * C. Outreaching lots of investors and pitching until I get enough funding
* The most realistic option fitting my legal (being on visa) and financial status (my savings are insufficient) is the option B.
* I'd love to work with people within my network, to work on this idea.
* No co-founder yet. I plan to hire only a co-founder during the first year.
* I'm open for intros.
