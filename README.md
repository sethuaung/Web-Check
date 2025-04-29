# WebCheck - https://webcheck.felixent.net
## OSINT tool, for quickly checking a website data.

[![Netlify Status](https://api.netlify.com/api/v1/badges/8733ea2d-df41-4022-a84c-3ea2bb449921/deploy-status)](https://app.netlify.com/sites/felixentwebcheck/deploys)

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/products/nsolid)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)

## Intro
Web-Check is a powerful all-in-one tool for discovering information about a website/host. The core philosophy is simple: feed Web-Check a URL and let it gather, collate, and present a broad array of open data for you to delve into.

The report shines a spotlight onto potential attack vectors, existing security measures, and the web of connections within a site's architecture. The results can also help optimizing server responses, configuring redirects, managing cookies, or fine-tuning DNS records for your site.

So, whether you're a developer, system administrator, security researcher, penetration tester or are just interested in discovering the underlying technologies of a given site - I'm sure you'll find this a useful addition to your toolbox.

Web-Check is developed and maintained by Felixent. It's licensed under the MIT license, and is completely free to use, modify and distribute in both personal and commercial settings.
Source code and self-hosting docs are available on GitHub. If you've found this service useful, consider sponsoring me from $1/month, to help with the ongoing hosting and development costs.

## Features
When conducting an OSINT investigation on a given website or host, there are several key areas to look at. Each of these are documented below, along with links to the tools and techniques you can use to gather the relevant information.

Web-Check can automate the process of gathering this data, but it will be up to you to interpret the results and draw conclusions.

### Contents
1. IP Info
2. SSL Chain
3. DNS Records
4. Cookies
5. Crawl Rules
6. Headers
7. Quality Metrics
8. Server Location
9. Associated Hosts
10. Redirect Chain
11. TXT Records
12. Server Status
13. Open Ports
14. Traceroute
15. Carbon Footprint
16. Server Info
17. Whois Lookup
18. Domain Info
19. DNS Security Extensions
20. Site Features
21. HTTP Strict Transport Security
22. DNS Server
23. Tech Stack
24. Listed Pages
25. Security.txt
26. Linked Pages
27. Social Tags
28. Email Configuration
29. Firewall Detection
30. HTTP Security Features
31. Archive History
32. Global Ranking
33. Block Detection
34. Malware & Phishing Detection
35. TLS Cipher Suites
36. TLS Security Config
37. TLS Handshake Simulation
38. Screenshot

# Fair Use
- Please use this tool responsibly. Do not use it for hosts you do not have permission to scan. Do not use it as part of a scheme to attack or disrupt services.
- Requests may be rate-limited to prevent abuse. If you need to make more bandwidth, please deploy your own instance.
- There is no guarantee of uptime or availability. If you need to make sure the service is available, please deploy your own instance.
- Please use fairly, as excessive use will quickly deplete the lambda function credits, making the service unavailable for others (and/or empty my bank account!).

# Privacy
- Analytics are used on the demo instance (via a self-hosted Plausible instance), this only records the URL you visited but no personal data. There's also some basic error logging (via a self-hosted GlitchTip instance), this is only used to help me fix bugs.

- Neither your IP address, browser/OS/hardware info, nor any other data will ever be collected or logged. (You may verify this yourself, either by inspecting the source code or the using developer tools)
