# Metas

* A [conversational agent](https://en.wikipedia.org/wiki/Dialog_system) built on [Ceiba](Ceiba.md) and [Grid](Grid.md)
* Nodes owned by the same (Ceiba) identity can communicate with one another and share resources (e.g., ask Metas to launch an application on your laptop from your phone, opening a document can transport it if needed)
* Grid searches are filtered/scaled by the social graph as a reliability metric (+ configurable trusted sources)
* Skills are plug-ins that can provide new capabilities. Skills are installed automatically, and are silent if not available due to missing underlying capabilities (e.g., a skill to allow discovery of devices via Bluetooth would be auto-disabled if no Bluetooth interface was available)
* Native app (mobile, desktop) providing a "conversational command-line" and speech interfaces + background agent
* Decisions are stored anonymously and non-identifiably in the Grid
  * A decision is a question or query, accompanied by a set of options, a recommendation based upon available facts, and an optional outcome (which option was chosen)
  * Decision records are used by Metas instances to bias their own recommendations based upon past behaviours (with emphasis on those with closer social connections)

## First run

```
Hello, my name is Metas. If you would like, I can speak out loud to you as well.

Would you like me to speak? I can be quiet whenever you need me to be.

Just say or type 'yes' or no', or words to that effect.

> yes

Would you like to choose what kind of voice I have?

70% of people seem to prefer the British female voice. 

If you would like me to use the British female voice, just say 'that's fine'. If you'd rather choose, just say 'a different one'.

> that's great, thanks

Hi. How does that sound?

If you can't hear anything, check your volume controls and say 'try again'. Otherwise, just tell me that it sounds fine.

> sounds good

I'm pleased to hear that.

Have you used Metas before, or would you like a guided tour of what I can do?

> I've used you before

No problem. I'll be here when you need something.

>
```
