## Rethinking modern web browsers

The major web browsers have achieved great improvements on their platform problems, while delegating all the product problems to third party extensions. This strategy scaled somewhat well for over the last decade, but now we're seeing the limitations. Major web browsers fail to provide specifically good experience for the group of users who needs web browsers most; superusers doing most of their work accessing information and tools via web browsers.

I believe this creates an opportunity for a **new web browser tailored for superusers**, by providing an opinionated web browsers for improving;

* [Productivity](#productivity)
* [Privacy](#privacy)
* [Security](#security)
* [Search](#search)
* [See it in action](#see-it-in-action)
* [Past Learnings](#past-learnings)

## Productivity

The general approach is to;

* Redesign tabbing bar
* Reduce dependency on search engines (see Security)
* Provide high-quality, builtin features for superusers, in favor of low-quality extensions

#### Redesigning tabbing bar

The horizontal tabbing bar was designed for the internet 30 years ago, and hasn't changed since then. Here are some problems with modern tabbing:

* It requires manual management
* Default order is by date and time the tab is opened
* Focus and context is not supported, multitasking and distraction is promoted

To address these issues, we can get rid of the tabbing bar all together, and show the user what's exactly relevant:

![](https://github.com/azer/fathomecat/blob/main/screencasts/screenshot.png?raw=true)

Once the tabbing bar is removed, the next problem to solve is switching between related pages. Let's say you're shopping for children books and you'd like to switch to another page you opened previously. See the screenshot, demonstrating the view of the browser, after clicking the address bar: it sorts all the "open tabs" based on their relevancy to what's already open:

![](https://raw.githubusercontent.com/azer/fathomecat/main/screencasts/tabbing%20view%20-%20amazon.png)

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

#### Previous Strategy (Failure)

In my previous attempt, I saw these problems and dropped ball on working on the browser, and started building the platform that would enpower the search engine. That was a mistake and led me to failure quickly, as it was impossible to acquire users for the data backend that will empower a web browser in the future.

#### Next Strategy

A better strategy is to not jump into all search problems at once, but picking the top priority and embedding it into the web browser. In the other words, the data backend we need would live inside the web browser, and wait until the time it'll be extracted into its own platform, to tackle more search problems, and grow into an external platform, an alternative search engine that works beats Google in quality, not quantity.

To summarize, this web browser's growth strategy would be evolving its data layer into a separate platform that functions as:

* A trust index for URLs
* A name (speed dial / keyword) index for URLs
* A popularity (site / content / relevancy) index
* A quality index (in later stages)

# See it in action

![](https://github.com/azer/fathomecat/blob/main/screencasts/browsing-800.gif?raw=true)

# Development Status

An early proof of concept of this browser [is available in Github](https://github.com/kaktus/kaktus).
