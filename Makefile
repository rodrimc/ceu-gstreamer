CFLAGS = -DCEU_DEBUG -Werror -Wall `pkg-config gstreamer-1.0 --cflags` -Wno-unused-variable
LDFLAGS = `pkg-config gstreamer-1.0 --libs`

# all: MAIN = main.c 
# all: CFLAGS += -DAPP_BULB
# all: compile 

# maestro: MAIN = maestro_main.c 
# maestro: CFLAGS += -DAPP_MAESTRO
# maestro: compile 

# player: MAIN = player_main.c 							
# player: CFLAGS += -DAPP_PLAYER
# player: CFLAGS += `pkg-config gstreamer-1.0 --cflags` 
# player: LDFLAGS += `pkg-config gstreamer-1.0 --libs`
# player: compile 

all:
	ceu --cpp-args "-I ." $(CEUFILE)
	gcc -g -Os main.c $(CFLAGS) $(LDFLAGS) -o $(basename $(CEUFILE)).out

clean:
	find . -name "*.out"  | xargs rm -f
	find . -name "_ceu_*" | xargs rm -f

.PHONY: all clean compile
