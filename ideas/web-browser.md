## Rethinking modern web browsers

The major web browsers have achieved great improvements on their platform problems, while delegating all the product problems to third party extensions. This strategy scaled somewhat well for over the last decade, but now we're seeing the limitations. Major web browsers fail to provide specifically good experience for the group of users who needs web browsers most; superusers doing most of their work accessing information and tools via web browsers.

I believe this creates an opportunity for a **new web browser tailored for superusers**, by providing an opinionated web browsers for improving;

* [Productivity](#productivity)
* [Privacy](#privacy)
* [Security](#security)

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

To address this issue, web browsers need a new "backend" to help following features implemented:

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

# See it in action

I recorded this gifcast tonight. It's not exactly how Fat Home Cat look like at the end, but you get the idea.

![](https://github.com/azer/fathomecat/blob/main/screencasts/browsing-800.gif?raw=true)

# Development Status

An early proof of concept of this browser [is available in Github](https://github.com/kaktus/kaktus).
