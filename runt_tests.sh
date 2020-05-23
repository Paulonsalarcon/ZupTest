#!bin/bash

if [[ -z "${INCLUDE_TAGS}" ]]; then
  INCLUDE=""
else
  INCLUDE="${INCLUDE_TAGS}"
fi

if [[ -z "${EXCLUDE_TAGS}" ]]; then
  EXCLUDE=""
else
  EXCLUDE="${EXCLUDE_TAGS}"
fi

if [[ -z "${BROWSER}" ]]; then
  TEST_BROWSER="headlesschrome"
else
  TEST_BROWSER="${BROWSER}"
fi

if [[ -z "${NUMBER_OF_PROCESSES}" ]]; then
  PROCESSES="1"
else
  PROCESSES="${NUMBER_OF_PROCESSES}"
fi

if [[ -z "${NAME}" ]]; then
  TEST_NAMES=""
else
  TEST_NAMES="${NAME}"
fi

python3 driver/driver.py -p  ${PROCESSES} -b $TEST_BROWSER -n $TEST_NAMES -i $INCLUDE -e $EXCLUDE