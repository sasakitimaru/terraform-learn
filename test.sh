if git diff --name-only origin/main HEAD | grep -q '^deployment/init/'; then
  echo "Deployment files have changed"
  exit 0
else
  echo "Deployment files have not changed"
  exit 1
fi