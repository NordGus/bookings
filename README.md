# Bookings

## Setup Environment
* Start development environment
    ```shell
    docker compose up dev
    ```
* Setup application's environment
    ```shell
    docker compose exec dev bin/setup
    ```
* Start development server
    1. Start bash session inside the container
        ```shell
        docker compose exec dev /bin/bash
        ```
    2. In the bash session run
       ```shell
       rails s -b 0.0.0.0
       ```
* Start javascript builds
    ```shell
    docker compose exec dev yarn build --watch
    ```
* Start sass builds
    ```shell
    docker compose exec dev yarn build:css --watch
