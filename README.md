# menuhax67

## Thanks 
- @Myriachan for help parsing 3dbrew.org correctly regarding SAFE MODE launching restrictions

## Intro

This is a secondary userland exploit for 3DS home menu. It can be triggered from cold boot but needs user interaction by tapping the home icon on the top left of the bottom screen.<br><br>

Note: This is developer proof-of-concept at the moment due to the initial intended purpose -- launching SAFE_MODE sysupdater without functioning shoulder button(s) -- likely being impossible, even with the SAFE_MODE boolean not set. This exploit could still be useful later on if an arm11 kernel sploit shows up, as it could help something like that attack arm9 in SAFE_MODE.

## What's needed

A 3ds (old or new) on firmwares:<br>
```
11.7.0-X  -> 11.15.0-X for USA, JAPAN
11.10.0-X -> 11.15.0-X for EUROPE
11.5.0-X  -> 11.15.0-X for KOREA
```
And a userland entrypoint with cfg:s or cfg:i to launch the 3dsx installer.

## Directions 

Check the release archive. Stay away if you're not a developer.

## Exploit details

Config block 0x50001, which contains a u8 brightness setting that indexes a table of u32 addresses, can be set to an out-of-bounds index (its normally 1-5). Located within cfg block 0x50009, there exists a single controllable u32 that's located within the u8's range. With these set properly, one can eventually redirect a function pointer to an address of their choice.

## Troubleshooting

- Problem: I want to uninstall the exploit but I can't get back to the homebrew app to uninstall it for whatever reason.<br>
Solution: Launch a DS title of some sort. DS internet settings or DS download play are okay. Then press the home button and then hold START and press down until the screen brightness noticably changes. This should restore your brightness to a normal value and unlink the exploit. It's still strongly recommended you uninstall with the 3dsx app at some point though.

## FAQ
Q: Why exist, if there's no immediate benefit to precious users?<br>
A: Memes, of course. This is menuhax 11.4+, after all :-p

Q: menuhax67? Why name it that?<br>
A: Memes, of course. I'll leave it as an exercise for the reader to decipher what the specific meaning is ;)

Q: Why you kill parental setting? Why you hate parent?<br>
A: There aren't a lot of config blocks that are large enough to fit an sd loading rop chain (and also get loaded by home menu), and parental controls was just big enough for that purpose. And parental controls suck, no offense to parents out there.

Q: Why did you choose Launcher.dat for the sd payload name? That erases my Gateway launcher.
A: Probably for the same reason Gateway did, to save enough space to fit a ropchain where I want.
RIP your Gateway launcher but GW3DS is really dead already. Get some proper cfw for Lenny's sake.