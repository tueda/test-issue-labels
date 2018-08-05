#!/bin/bash

go_to_column() {
  local column="$1"
  printf "\x1B[%dG" $(( $column + 1 ))
}

clear_to_end_of_line() {
  printf "\x1B[K"
}

printf "abcdef"
#go_to_column 2
#printf "34"
printf "\n"

printf "abcdef"
#go_to_column 2
#printf "34"
printf "\n"

printf "abcdef"
#go_to_column 2
#printf "34"
printf "\n"
