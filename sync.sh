#!/bin/sh

clone_and_sync() {
  git clone https://github.com/AmrMKayid/sync2.git sync2/
  rsync --progress -r -u kaysync/* sync2/
}

new_branch_update() {
  now=$(date +'%m/%d/%Y')
  cd sync2
  update_branch="update_${now}"
  echo $update_branch
  git checkout -b $update_branch
  git add .
  git commit -m "New Update: ${now}"
  git push --set-upstream origin $update_branch
}

clone_and_sync
new_branch_update
