+++
title = "Adjusting font properties in CSS"
date = 2024-07-11
tags = ["TIL"]
+++


Ever got a font that looks whack i.e. isn't visually centered horizontally:

<center>
<img src="/images/2025-01-07-adjust-fontproperties-in-css-1.webp" style="width: 220px;"/>
</center>

?

EZ. We can use

- `ascent-override`
- `descent-override`
- `line-gap-override`

inside the `@font-face` declaration to fix this.

In this example we would set `descent-override: 10%;` which results in a nicer look:

<center>
<img src="/images/2025-01-07-adjust-fontproperties-in-css-2.webp" style="width: 220px;"/>
</center>


That's it... But of course, this is not available in Safari.

---
<center>🖕🖕🖕 FUCK YOU SAFARI 🖕🖕🖕</center>
<center>Safari is the new Internet Explorer</center>

---

Steve würde sich im Grab umdrehen. :( RIP


## Resources

- [https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face#descriptors](https://developer.mozilla.org/en-US/docs/Web/CSS/@font-face#descriptors)
- [https://stackoverflow.com/a/72243280](https://stackoverflow.com/a/72243280)

