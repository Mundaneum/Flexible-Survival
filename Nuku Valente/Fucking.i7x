Version 2 of Fucking by Nuku Valente begins here.
[Version 2.1 - No sex messages for certain NPCs]

Section 1 - Fucking action and table

A person has a number called lastfuck.

Fucking is an action applying to one thing.

Understand "fuck [person]" as fucking;

check fucking:
	if noun is not visible, say "Who?" instead;
	
Carry out fucking:
	say "They don't seem very interested.";


[No sex responses for some NPCs]
instead of fucking Doctor Matt:
	say "Doctor Matt recognizes the glint of arousal in your eyes as you imagine peeling him out of the suit.  He takes a few steps towards the back wall of the room, hovering his hand over the intercom.  'You're not going feral on me, are you?  Control yourself, or I'll have to call Orthas!'";

instead of fucking Rod Mallrat:
	if Ronda Mallrat is in the Mall Atrium:
		say "'Dude!  I'm already taken.  Ronda would kill us me if I fooled around.  Besides,' he adds with a wink, 'she's quite the sweet ride in the sack.  I'm covered.'";
	otherwise:
		say "Rod just sighs sadly and shakes his head.";

instead of fucking Ronda Mallrat:
	say "'Hey now, I ain't no floozy rat like some.  I've already got me a sexy guy wrapped around my finger.  Why would I need you?' she says, making the other girls nearby giggle.";

[Fucking v2.0 table]

Table of fucking options
title	sortorder	subtable	description	toggle
"Nothing"	1	--	"Nothing here."	sexytable rule
with 20 blank rows.

This is the sexytable rule:
	say "I'm a playholder! :)";


Section 2 - Demonstration Example

[*** BELOW IS AN EXAMPLE OF A CHARACTER USING THE NEW FUCKING TABLE SYSTEM ***]
[To build your own, the various Testerbot components would have to be renamed to prevent duplication.]

Testerbot is a person.
The description of Testerbot is "[testerbotdesc]";
The conversation of Testerbot is { "Disgusting!" }.
lastfuck of Testerbot is normally 555.

to say testerbotdesc:				[Description]
	say "I'm a non-existent character made for demonstration purposes so I can be used as a template for other NPCs.";

instead of conversing the Testerbot:	[Smell]
	say "[one of]'Why was I programmed to feel pain?'[or]'You organic creatures are disgusting.'[or]'Why do you lifeforms make so many fluids?'[or]'Why must you use me to satisfy your squishy, biological urges?'[at random]";

instead of sniffing the Testerbot:		[Talking]
	say "Testerbot reeks of sex, as that's what it's used for.  What a sad, sad life it leads.";

instead of fucking the Testerbot:		[Fucking]
	if lastfuck of Testerbot - turns < 8:
		say "     Having already been used within the last day, the testerbot needs to recharge.  This method is used to create a delay between the repetition of sex sessions.";
	otherwise:
		say "     The testerbot comes over to you, resigned to fulfilling its function.";
		wait for any key;
		say "[testerbotselection]";
		now lastfuck of Testerbot is turns;

[The part below creates the table of options available to the player upon each request for sex.]
[It can be used for NPCs/monsters with numerous (and variable) options, but is not required.]
[This way, a changing player or changing events will be reflected each time.]
[You must ensure that there is always at least one choice available on the menu.  The best way...]
[...to do this is to have at least one that has no 'if' requirements.]
[The 'title entry' is the name the displayed option will have.  Avoid repetition within the same character's listing.]
[The 'sortorder' entry is the order they'll be displayed to the player in the menu.  A different number...]
[...should be used for each, but they don't have to be sequential number, or be written into the selection subroutine.]
[The 'description entry' is the description/added text displayed when confirmation is requested.]
[The 'toggle entry' is the command rule that holds the instructions and displays the sex scene.]

to say testerbotselection:
	blank out the whole of table of fucking options;
	choose a blank row in table of fucking options;
	now title entry is "Choice 1";		[A choice placed like this is available w/o restrictions.]
	now sortorder entry is 1;
	now description entry is "This is confirm message/description applied to choice 1.";
	now toggle entry is testerbotsexy rule;
	if cocks of player > 0:
		choose a blank row in table of fucking options;
		now title entry is "Choice 2";
		now sortorder entry is 2;
		now description entry is "This is an option that only appears for players with a cock (male or herm).";
		now toggle entry is testerbotsexy rule;
	if cocks of player > 0 and cunts of player is 0:
		choose a blank row in table of fucking options;
		now title entry is "Choice 4";
		now sortorder entry is 4;
		now description entry is "This is an option that only appears for fully male characters.";
		now toggle entry is testerbotsexy rule;
	if cunts of player > 0:
		choose a blank row in table of fucking options;
		now title entry is "Choice 3";
		now sortorder entry is 3;
		now description entry is "This is an option that only appears for players with a cunt (female/herm).";
		now toggle entry is testerbotsexy rule;
	if cunts of player > 0 and hp of Testerbot > 1:
		choose a blank row in table of fucking options;
		now title entry is "Choice 5";
		now sortorder entry is 5;
		now description entry is "An option given only if the player has a cunt and hp of Testerbot is 2 or more.";
		now toggle entry is testerbotsexy rule;
	if cunts of player is 0 and bodyname of player is "Robot":
		choose a blank row in table of fucking options;
		now title entry is "Choice 6";
		now sortorder entry is 6;
		now description entry is "An option given only if the player has a cunt and a 'Robot' body infection.";
		now toggle entry is testerbotsexy rule;
	sort the table of fucking options in sortorder order;
	change the current menu to table of fucking options;
	carry out the displaying activity;
	clear the screen;

[This is the section to put the chosen option into effect, playing out the sex scene.]

This is the testerbotsexy rule:
	choose row Current Menu Selection in table of fucking options;
	let nam be title entry;
	say "[title entry]: [description entry][line break]";
	say "Is this what you want?";
	if player consents:
		decrease menu depth by 1;
		clear the screen;
		if nam is "Choice 1":
			say "This is the described scene for the sex done through option 1.";
		otherwise if nam is "Choice 2":
			say "This is the described scene for the sex done through option 2.";
			if hp of Testerbot is 1, now hp of Testerbot is 2;
		otherwise if nam is "Choice 3":
			say "This is the described scene for the sex done through option 3.";
			if hp of Testerbot is 1, now hp of Testerbot is 2;
		otherwise if nam is "Choice 4":
			say "This is the described scene for the sex done through option 4.";
			increase libido of player by 5;
		otherwise if nam is "Choice 5":
			say "This is the described scene for the sex done through option 5.";
		otherwise if nam is "Choice 6":
			say "[testerbotsex6]";
		wait for any key;

to say testerbotsex6:
	say "     This scene is the sex scene played out by choosing option 6.  Longer and more elaborate scenes can be broken out in the this manner for easier reading, coding and testing, or can still be built into the regular structure like above.";


Fucking ends here.
