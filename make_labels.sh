#!/bin/sh

# Script assumes you have gh cli installed and have already done a gh auth login

create_label()
{
  ORG_REPO=$1 # e.g. ucsb-cs156-f22/f22-5pm-courses
  NAME=$2 # e.g. 10
  DESCRIPTION=$3 # e.g. "10 pts"
  COLOR=$4 # e.g. "fbca04"
  gh api --method POST -H "Accept: application/vnd.github+json" /repos/${ORG_REPO}/labels -f name="$NAME" -f description="$DESCRIPTION" -f color="$COLOR"
}


delete_label () {
  ORG_REPO=$1 # e.g. ucsb-cs156-f22/f22-5pm-courses
  NAME=$2 # e.g. 10
  gh api --method DELETE -H "Accept: application/vnd.github+json" "/repos/${ORG_REPO}/labels/${NAME}"
}

update_label_color () {
  ORG_REPO=$1 # e.g. ucsb-cs156-f22/f22-5pm-courses
  NAME=$2 # e.g. 10
  NEW_COLOR=$3 # e.g. "fbca04"
  gh api --method PATCH -H "Accept: application/vnd.github+json"  /repos/${ORG_REPO}/labels/${NAME} -f color="${NEW_COLOR}"
}

# for section in 5pm 6pm 7pm; do
#   for project in courses happycows ; do
#     R="ucsb-cs156-f22/f22-${section}-${project}"
#     echo "Creating labels for $R"
#     create_label $R "5" "5 pts" "fbca04"
#     create_label $R "10" "10 pts" "fbca04"
#     create_label $R "20" "20 pts" "fbca04"
#   done
# done

# create_label ucsb-cs156-f22/f22-5pm-courses "f22-5pm-1" "f22-5pm-1" "0052CC"
# create_label ucsb-cs156-f22/f22-6pm-courses "f22-6pm-1" "f22-6pm-1" "0052CC"
# create_label ucsb-cs156-f22/f22-7pm-courses "f22-7pm-1" "f22-7pm-1" "0052CC"
# create_label ucsb-cs156-f22/f22-5pm-courses "f22-5pm-2" "f22-5pm-2" "0E8A16"
# create_label ucsb-cs156-f22/f22-6pm-courses "f22-6pm-2" "f22-6pm-2" "0E8A16"
# create_label ucsb-cs156-f22/f22-7pm-courses "f22-7pm-2" "f22-7pm-2" "0E8A16"

# create_label ucsb-cs156-f22/f22-5pm-happycows "f22-5pm-3" "f22-5pm-3" "5319E7"
# create_label ucsb-cs156-f22/f22-6pm-happycows "f22-6pm-3" "f22-6pm-3" "5319E7"
# create_label ucsb-cs156-f22/f22-7pm-happycows "f22-7pm-3" "f22-7pm-3" "5319E7"
# create_label ucsb-cs156-f22/f22-5pm-happycows "f22-5pm-4" "f22-5pm-4" "B60205"
# create_label ucsb-cs156-f22/f22-6pm-happycows "f22-6pm-4" "f22-6pm-4" "B60205"
# create_label ucsb-cs156-f22/f22-7pm-happycows "f22-7pm-4" "f22-7pm-4" "B60205"


# update_label_color ucsb-cs156-f22/f22-5pm-happycows "f22-5pm-4" "990099"
# update_label_color ucsb-cs156-f22/f22-6pm-happycows "f22-6pm-4" "990099"
# update_label_color ucsb-cs156-f22/f22-7pm-happycows "f22-7pm-4" "990099"

for section in 5pm 6pm 7pm; do
  for project in courses happycows ; do
    R="ucsb-cs156-f22/f22-${section}-${project}"
    echo "Deleting labels for $R"
    # delete_label $R "documentation"
    # delete_label $R "duplicate"
    # delete_label $R "enhancement"
    # delete_label $R "help wanted"
    # delete_label $R "invalid"
    # delete_label $R "question"
    # delete_label $R "wontfix"
    delete_label $R "good first issue"
  done
done