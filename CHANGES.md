# Changes in version v1.2

- Workdir is now /workspace which should be used to share local the local directory 

# Changes in version v1.1

- Split Dockerfile into k8s-access-base and k8s-access
- The user is now added during the entrypoint to allow the local user 
  to be set when using the image 
- Added an entrypoint script that handles user creation, auto-completion
  and running the image with local user permissions
- Removed repo from travis
- Corrected the version of the base image to v1.1
- Added the effective group id to the entrypoint 

# Changes in version v1.0

## New Features

- kubectl, aws and helm do now bash auto complete

## Fixes

- Auto complete system dependency has been added
- The docker image has now an upgraded system to minimize security issues