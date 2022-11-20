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


create_pr_review_labels() {
    create_label $1 "FIXME: Add Team Label" "Please add the label for your team, e.g. f22-4pm-3"
    create_label $1 "FIXME: Peer CR" "Please get a peer code review" "B60205"
    create_label $1 "FIXME: Changes Requested" "Please address the changes specified in the code review" "B60205"
    create_label $1 "FIXME: CI/CD Failure" "One or more CI/CD checks is not green" "B60205"
    create_label $1 "FIXME: Merge Conflicts" "Please address the merge conflicts in this PR" "B60205"
    create_label $1 "INSTRUCTOR: assign pts" "PR merged by TA/LA; deferring points to instructor" "D93F0B"
    create_label $1 "Merge Candidate: Needs QA deploy" "Staff thinks this may be mergeable; needs to be tested on QA" "0E8A16"    
    
}

 for section in 5pm 6pm 7pm; do
   for project in courses happycows ; do
     R="ucsb-cs156-f22/f22-${section}-${project}"
     echo "Creating labels for $R"
     create_pr_review_labels $R
   done
 done


