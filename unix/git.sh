function gitfetchall() {
  # Capture the current branch name
  current_branch=$(git rev-parse --abbrev-ref HEAD)

  # Fetch all remote branches
  git fetch origin

  # Loop through the remote branches and create corresponding local branches
  for branch in $(git branch -r | grep -v '\->' | sed 's/origin\///'); do
    git checkout -b $branch origin/$branch || git checkout $branch
  done

  # Switch back to the original branch
  git checkout $current_branch
}

function gitquick(){
    git add .;
    git commit -m "WIP"
    git push;
}

function gitscriptupdate(){
  scripts;
  git pull;
  fsource;
  echo "Scripts pulled and updated."
}