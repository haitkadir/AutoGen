#!/bin/bash

if [ -z "$1" ]
  then
    echo "Bad args. Example: class className"
	exit 1
fi


Name=$1
UpperName=$(echo "$Name" | tr '[:lower:]' '[:upper:]')

HEADER="#ifndef __"$UpperName"_H__
#define __"$UpperName"_H__

class $Name{
private:
    // your privite members here
public:
    $Name ();
    $Name (const $Name &a);
    ~$Name ();
    $Name & operator = (const $Name &a);
};

#endif
"

SRC="#include \"$Name.hpp\"

/*-----------------------------------------------------*/
$Name::$Name (){
    // your implementation here
}

/*-----------------------------------------------------*/
$Name::$Name (const $Name &a){
    // your implementation here
}

/*-----------------------------------------------------*/
$Name::~$Name (){
    // your implementation here
}

/*-----------------------------------------------------*/
$Name & $Name::operator = (const $Name &a){
    // your implementation here
}
"

echo "$HEADER" > "$Name.hpp"
echo "$SRC" > "$Name.cpp"
