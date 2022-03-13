---
layout: post
title:  ""
author: seri
categories: [ computer vision ]
image: assets/images/depth/1.jpg
tags: featured
---

<!--more-->

<h2> Introduction </h2>

<h3> Learning About General Topics </h3>

In addition to help content for individual commands, the PowerShell help system provides *About Topics*, which are help snippets for broader subjects and specific commands. For example, in this chapter you're learning about some of PowerShell's core commands. Microsoft has created an *About Topic* that gives an overall explanation of these commands. To see it, you run `Get-Help about_Core_Commands` as shown in Listing 1-9.

To get a complete list of all the About topics available, use a wildcard for the *Name* parameter. In PowerShell, the *wildcard* character, an asterisk, can be used as a placeholder for zero or more characters. You can use a wildcard with the `Get-Help` command's *Name* parameter, as in Listing 1-10. 

```
Get-Help -Name About*
```

By appending the wildcard to About, you're asking PowerShell to search for all possible topics that start with *About*. If there are multiple matches, PowerShell will display a list, with brief information about each. To get the full information about one of the matches, you'll have to pass it into `Get-Help` directly, as shown in previously in Listing 1-9. 

Although the `Get-Help` command has a *Name* parameter, you can pass the parameter argument directly to it by entering `-Name`, as shown in Listing 1-10. This is known as using a positional parameter, which determines the value you're passing in based on its position in the command. Positional parameters are a shortcut that many PowerShell commands have, allowing you to reduce the number of keystrokes. 

<span class="sidenote"> At times it's necessary to run the PowerShell console as Administrator. This typically happens when you need to modify files, the registry, or anything else that's outside your user profile. For example, the `Update-Help` command mentioned previously needs to modify the system-level files and cannot be run properly by a non-Administrator user. You can run PowerShell as an Administrator by right-clicking in Windows PowerShell and then clicking `Run as Administrator`, as shown in Figure 1-2. </span>





<picture><img src="{{site.baseurl}}/assets/images/disparity.png"></picture>

<h2> References </h2>
<ul><li><a=href=""> TheAILearner </a></li>
</ul>

