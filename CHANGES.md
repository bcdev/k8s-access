# Changes v1.1 and v1.3

- Split Dockerfile into k8s-access-base and k8s-access
- The user is now added during the entrypoint to allow the local user 
  to be set when using the image 
- Added an entrypoint script that handles user creation, auto-completion
  and running the image with local user permissions

# Changes v1.1 and v1.2

## New Features

- kubectl, aws and helm do now bash auto complete

## Fixes

- Auto complete system dependency has been added
- The docker image has now an upgraded system to minimize security issues