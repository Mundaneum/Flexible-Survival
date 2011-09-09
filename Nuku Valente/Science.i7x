Science by Nuku Valente begins here.

When play begins:
	repeat with x running through research:
		now x is a part of the nerd	;

Book - Science Advisor

Nerd is a person. "A science advisor awaits your attention. They have a name, but most just call them the [bold type]nerd[roman type]. Perhaps you want to discuss [bold type]research[roman type].".
Nerd is in Village center.
The description of nerd is "[science advisor of tribe of player]";

After examining the nerd:
	if progress of current of nerd < cost of current of nerd:
		say "Current Research Topic: [current of nerd]([progress of current of nerd]/[cost of current of nerd])";
	say "[line break]To begin a new topic, type [bold type]research (topic)[roman type].";
	say "Type [bold type]research[roman type] alone to see available topics.";

Nerding is an action applying to nothing.
Understand "nerd" as nerding.

check nerding:
	say "The nerd is a person, not an action. You could try looking at them?(look nerd)" instead;
	
Part - Change Topics

Researchlist is an action applying to nothing.
Understand "Research" as researchlist.

Check researchlist:
	if nerd is not visible, say "You need your trusty ner, er, science advisor, to conduct matters of research." instead;

carry out researchlist:
	say "Available Topics: ";
	repeat with x running through valid research:
		if x is complete, next;
		say "[x]([progress of x]/[cost of x])[if current of nerd is x](Current Topic)[end if]";
	say "To begin a new topic, type [bold type]research (topic)[roman type].";
	
Researching is an action applying to one thing.
Understand "Research [research]" as researching.

Check researching:
	if nerd is not visible, say "You need your trusty ner, er, science advisor, to conduct matters of research." instead;
	if noun is complete, say "You seem to have already completed that topic." instead;
	if noun is current of nerd, say "Your advisor assures you that it is already being worked on as hard as it can be. Maybe if we had more scientists?" instead;

Carry out researching:
	say "[description of noun]";
	say "Begin?";
	if the player consents:
		now current of nerd is noun;
		say "You begin researching [noun].";
	otherwise:
		say "Aborted.";
		
	
Book - Define Research

A Research is a kind of thing.
A Research has a text called Description.
A Research has a rule called validation.
The validation of a Research is usually Warvailable rule.
A Research has a number called progress.
A Research has a number called cost.
A Research has a rule called Completion.
The completion of a research is usually nothing rule;

This is the nothing rule:
	do nothing;
	
Definition: A Research (called J) is valid:
	follow the validation of J;
	if rule succeeded:
		yes;
	otherwise:
		no;

Definition: A Research (called J) is complete:
	if progress of J >= cost of J:
		yes;
	otherwise:
		if the printed name of J is listed in perks of tribe of player:
			yes;
		otherwise:
			no;


Part 2 - Research Topics

The nerd has a research called current.
cur is a text that varies.

Local Survey is a Research.
The description of it is "Surveying our immediate sorroundings will better prepare us for the unexpected(Perception +5%)".
The cost of it is 30.
The completion of it is Local Survey Rule.

This is the local survey rule:
	now perception of tribe of player is ( perception of tribe of player * 105 ) / 100;
	say "The perception of your tribe is now [perception of tribe of player]";

An everyturn rule(this is the SCIENCE rule):
	if science of tribe of player is less than 1, continue the action; [ No research without research points ]
	if current of nerd is complete:
		say "Your current research topic is complete. You should pick a new one.";
		continue the action;
	let foragers be 0; [ No scientist job yet]
	increase foragers by 1; [The nerd is always there. They love you!]
	[First check for easy to grab salvage, will become more scarce over time]
	let x be a random number from 80 to 120; [mild variance]
	increase x by (Intelligence of tribe of player) / 5;
	if "Brilliant" is listed in perks of tribe of player:
		increase x by 20;
	now x is x * foragers * 2;
	now x is x / 100;
	if x is greater than 0: [ There is science to be done ]
		if x is less than 1, now x is 1;
		say "Your science advances: +[x]";
		increase progress of current of nerd by x;
		if current of nerd is complete:
			say ". [bold type][current of nerd][roman type] is complete!";
			follow the completion of current of nerd;
			add the printed name of current of nerd to perks of tribe of player;
		decrease science of tribe of player by x;


Science ends here.