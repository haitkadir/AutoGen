#!/bin/bash

if [ -z "$1" ]
  then
    echo "Bad args. Example: class className"
	exit 1
fi


Name=$1
UpperName=$(echo "$Name" | tr '[:lower:]' '[:upper:]')

# ----------------- Header file ------------------------------------------------
HEADER="#ifndef __"$UpperName"_H__
#define __"$UpperName"_H__

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
$Name::$Name (){
    std::cout << \"$Name: Default constructor called!\" << std::endl;
}

/*----------------------------------------------------------------------------*/
$Name::$Name (const $Name &a){
    std::cout << \"$Name: Copy constructor called!\" << std::endl;
}

/*----------------------------------------------------------------------------*/
$Name & $Name::operator = (const $Name &a){
    if (this != &a){
        std::cout << \"$Name: Copy assignment operator called!\" << std::endl;
    }
}

/*----------------------------------------------------------------------------*/
$Name::~$Name (){
    std::cout << \"$Name: Destructor called!\" << std::endl;
}
"

echo "$HEADER" > "$Name.hpp"
echo "$SRC" > "$Name.cpp"
