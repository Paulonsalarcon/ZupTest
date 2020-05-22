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

if [[ -z "${EXCLUDE_TAGS}" ]]; then
  EXCLUDE=""
else
  EXCLUDE="${EXCLUDE_TAGS}"
fi