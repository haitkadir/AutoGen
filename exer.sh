#!/bin/bash

if [ -z "$2" ]
  then
    echo "Bad args. Example: exer exerciseName className"
	exit 1
fi

if [ -d "$PWD/$1" ]
then
        echo "$1 Already Exist!"
        exit 1
fi

Ex=$1
Name=$2
UpperName=$(echo "$Name" | tr '[:lower:]' '[:upper:]')
LowerName=$(echo "$Name" | tr '[:upper:]' '[:lower:]')

# ----------------- Makefile file ------------------------------------------------

MAKEFILE=".PHONY: all clean fclean re

CC = c++

CFLAGS = -Wall -Wextra -Werror

CPP_VERSION = -std=c++98

NAME = $LowerName


SRCS = main.cpp $Name.cpp

HEADERS = $Name.hpp

OBJS = \$(SRCS:%.cpp=%.o)

\$(NAME): \$(OBJS)
	@\$(CC) \$(CFLAGS) \$(CPP_VERSION) \$(OBJS) -o \$(NAME)
	@echo \"Compiled!. Use\033[0;32m ./\$(NAME)\033[0m\n\"

all: \$(NAME)

%.o:%.cpp \$(HEADERS)
	@\$(CC) \$(CFLAGS) \$(CPP_VERSION) -c $< -o \$@
	@echo \"$< ==> \$@\"

clean:
	@rm -f \$(OBJS)

fclean: clean
	@rm -f \$(NAME)
	clear

re: fclean all
"

# ----------------- Header file ------------------------------------------------
HEADER="#ifndef __"$UpperName"_H__
#define __"$UpperName"_H__
#include <iostream>

class $Name{
private:
    // your Privite members here
protected:
    // your Protected members here
public:
    $Name ();
    $Name (const $Name &a);
    $Name & operator = (const $Name &a);
    ~$Name ();
};

#endif
"

# ----------------- Source file ------------------------------------------------
SRC="#include \"$Name.hpp\"

/*----------------------------------------------------------------------------*/
$Name::$Name () {}

/*----------------------------------------------------------------------------*/
$Name::$Name (const $Name &a){
    *this = a;
}

/*----------------------------------------------------------------------------*/
$Name & $Name::operator = (const $Name &a){
    if (this != &a){
        std::cout << \"$Name: Copy assignment operator called!\" << std::endl;
    }
    return *this;
}

/*----------------------------------------------------------------------------*/
$Name::~$Name () {}
"

# ----------------- Main file ------------------------------------------------
MAIN="#include \"$Name.hpp\"

int main(void){
    // your main code here
    return 0;
}
"



mkdir "$Ex"
echo "$MAKEFILE" > "$Ex/Makefile"
echo "$HEADER" > "$Ex/$Name.hpp"
echo "$SRC" > "$Ex/$Name.cpp"
echo "$MAIN" > "$Ex/main.cpp"
