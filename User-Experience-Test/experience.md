# User Experience Test

## Plan

### Introduction

Here is the introduction presented to the participant:

- We are going to talk about what code reviews are and what tools can be used.
- Next we are going through each developed technique. Before using each prototype I explain how the technique works.
- Then You open the prototype and use it as explained before.
- Immediately afterwards you answer a questionnaire to express you feeling about the usability of the used features. Some of the verified attributes do not correspond fully to the topic, but need to be answered also.

Then we ask the following questions :

- What experience do you have with doing code reviews?
- What tools for code review are you familiar with?

If the participant is unfamiliar with code reviews, we explain the following elements

- What is code review: Code review serves as gate keeper, to assure readability of the submitted code, it’s comprehensibility and that the company’s conventions are applied correctly. Also, with code review, arbitrary code submission is avoided. 
- How to do code reviews: Using mail exchange, peer-review side by side, or assisted by a tool such as Github and Gerrit.
- How it works tool-assisted:
  - The author writes code or modifies it and submits to the repository.
  - The reviewer analyses the changes with the diff-tool.
  - The reviewer makes comments and suggestions.
  - The author receives the feedback and either applies it or discusses with the reviewer.
  - This process repeats until the reviewer approves and the code is submitted fully to repository.

### Test

Here are the instructions given to the participants:

- Briefing: The here showed functions are supposed to be used on top of already existing tools such as Github and Gerrit. Therefore basic functionality is supposed to be working. But for the reason of being a prototype, these functions were not implemented fully. The focus is put on the comment function and other aspects that are explained before using each technique.
- Your position: You are a reviewer and asked to review the following changes of piece of code. The question to keep in mind; "Do the tested techniques add useful functionality to the code review process?".

The participant then opens the [index.html](/Prototypes/index.html) file in the [Prototypes](/Prototypes) folder and performs the different code review tasks.

During the test, we take notes of the behavior of the participant for the different techniques.

### Post-test

Following the test, the participant has to fill in the questionnaire available in the file [UEQ.pdf](/User-Experience-Test/UEQ.pdf).

In addition to the UEQ, we asked the participants the following open-ended questions to collect additional feedback:

- Do you think the technique improves the code review process?
- What can be improved in your opinion about the presented tools?

## Participants

- P1: Software engineer for many years. Has worked for many companies already. He is experienced in code reviews, but only peer-review side by side. He has no experience with tool-based code reviews (modern code reviews).
- P2: Worked in a company. Has already used a diff-tool; not the same as Github, but the concept is the same. He knows Github, but not Gerrit.
- P3: Worked in companies. Has already used a diff-tool, like with Github; but mainly worked in the position as author, not as reviewer.
- P4: Professional experience with Github using Pull requests and making comments. As well as verifying that projects respect conventions and formalisms.
- P5: Short professional experience with Github, being reviewed and as in position as reviewer. Familiar with diff-tool.

## User Experience Questionnaire (UEQ)

We used the UEQ_Data_Analysis_Tool_Version10 to process and analyse the different answers to the [UEQ](https://www.ueq-online.org):

- Technique 3.1 - Advice in [UEQ_Data_Analysis_Tool_Version10_T1.xlsx](/User-Experience-Test/UEQ_Data_Analysis_Tool_Version10_T1.xlsx)
- Technique 3.2 - Assistant in [UEQ_Data_Analysis_Tool_Version10_T2.xlsx](/User-Experience-Test/UEQ_Data_Analysis_Tool_Version10_T2.xlsx)
- Techniques 3.3 - Guide in [UEQ_Data_Analysis_Tool_Version10_T3.xlsx](/User-Experience-Test/UEQ_Data_Analysis_Tool_Version10_T3.xlsx)

The following figure presents a summary of the results using the [combined-graph.R](/User-Experience-Test/combined-graph.R) script.

![Results of the UEQ benchmark](/User-Experience-Test/benchmarkT3.png "Results of the UEQ benchmark for the advice with example (T3.1), the quick search with expert feedback (T3.2), and the guide (T3.3). Dots denote mean values, and error bars indicate 95\% confidence intervals.")

## Behavior of the participants

During the experience, we took notes of the behavior of the participants for the different techniques.

### Technique 3.1 - Advice

- Structure button is used by some. Some don’t notice the button.
- When the structure button is used, then the comment is written in a structured way as proposed by the keywords.
- The advice is read only briefly. No participant reads the advice intentionally in order to apply it in the comment.
- The advice is not read at all, because reading the structure seams sufficient. Only the structure is read and applied. But not necessarily the button is used.
- First the structure advice is read, then the comment is written. Afterwards, the general advice is read and applied as far as possible.

### Technique 3.2 - Assistant

- Most participants search for a solution on the internet instead of using the search field.
- Some say they prefer this technique compared to technique 2.
- One participant does not use the expert button, because he thinks he is experienced enough in the displayed language.
- One participant uses the solution search box correctly (supposedly because he got a better briefing than the other participants).
- None of the participants use the expert feature explicitly. Mostly because they feel like they are experienced enough.

### Techniques 3.3 - Guide

- Short comments are given after using the guide. This could be due to the duration of the test, making the participants tired of making the same comment.
- One participant first misses the comment because his mouse does not hover over the focus. However, one participant gives a full comment as before.
- Comments generally fall out shorter compared with technique 1 and 2.

## Additional feedback

### Feedback Technique 3.1 - Advice

- The UI is confusing due to the white background. The advice is not visible immediately. The user focusses on the upper part only, the example. Also, instead of giving a positive vibe as explained in the advice, the example only covers negative aspects of the comment, which is a contradiction.
- Structure for complete comment should be inside text area when opening the form.
- Proposing a structure like this allows standardizing comments.
- This encourages communicating in a non-personal/constructive way.
- Using a placeholder to guide the structured comment would be better.
- Speeds up commenting, because the structure is already there.
- The author expects always the same structure which makes the reception easier for the author and more natural instead of commenting on a personal level.
- Because the structure is not forced on the reviewer, not all comments necessarily have the same structure. On the other hand this way the reviewer keeps the liberty how to respond.

### Feedback Technique 3.2 - Assistant

- The fact that solutions can be searched so easily is much appreciated.
- The keyword “add” is misleading compared to “search”.
- This technique is appreciated because of the simplicity it offers in usage.
- Critical in terms of security concerning the copyright of code snippets from other sites.
- Critical also in terms of security concerning the quality of code snippets.
- The search is an interesting tool, to gain time, and used always, but not always correctly.
- Expert, perhaps people don’t want to annoy someone. Probably not many people will use it.

### Feedback Techniques 3.3 - Guide

- The reviewer could be influenced from what the author writes as comment and so give a biased feedback. However, having a mix of technique 2 and 3 would provide a complete and useful help.
- This technique makes for an easier understanding of the code changes for all participants.
- This technique pushes the reviewer to make a usefull/complete description of the changes. Compared to before, where often times the commit message is left out or only briefly responded.
- Many participants would like a combination of technique 2 and 3. Also, some participants request being able to make comments while using the guide (see side-effects).
- Guide is interesting feature, because now there is logic to be followed from file to file. Before, this was not the case.
- The guide requires making only one change per commit. Not mixing multiple change stories in one commit.
- However, it must be evaluated whether the time invested in organizing commits with stories and making the actual guide as author yields a better quality of reviews.
