# bzflag



## MAPS:
You can find maps in:
https://static.bzexcess.com/downloads/bzWorlds/
put .bzw in maps folder, and edit -world in .gitlab-ci file


## Build:
docker build -t bzflag .


## RUN:
to run the game server:
docker run --rm -p 5154:5154/udp -p 5154:5154 --name bzflag -d bzflag:latest -world maps/Black-Forest.bzw -loadplugin thiefControl -loadplugin playHistoryTracker -loadplugin fastmap -loadplugin ScoreRestorer

## Edit Maps:
https://github.com/BZFlagCommunity/webbzw
