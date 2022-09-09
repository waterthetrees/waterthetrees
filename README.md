<h1 align="center">
  <br>
  <a href="https://waterthetrees.com">
    <img src="https://waterthetrees.com/b7a4f5a36b1c145ed2fb.svg"
         alt="logo"
         width="200"
    />
  </a>
  <br>
  Water The Trees
  <br>
</h1>

[Water The Trees](https://waterthetrees.com) is a platform that crowd sources
tree planting and maintenance. We believe in the power of trees to restore
natural habitat for animals, insects, and fauna. We are interesting in
continuous massive tree planting events to help sequester carbon and stabilize
climate change extremes.

This is an open source project run by tree planting volunteers at
[Sierra Club](https://www.sierraclub.org) and
[Public Works](https://www.alamedaca.gov/Departments/Public-Works-Department/Street-Trees),
and developers at [Code for San Francisco](https://www.codeforsanfrancisco.org).

- Website: https://waterthetrees.com
- Technology: Mapbox, React, Node, Postgres/PostGIS, Martin, Nginx, Docker

https://user-images.githubusercontent.com/6326660/180594618-f83d34f6-9c08-41bd-8970-56d19ea8d1e2.mov

## Table of Contents

- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Run Locally](#run-locally)
- [Contributing](#contributing)
  - [Join Us](#join-us)
  - [Development](#development)
  - [Bug Reports & Feature Requests](#bug-reports--feature-requests)

## Getting Started

These instructions will get the project up and running on your local machine for
development and testing purposes. If you encounter any trouble with these
instructions please create an issue with the details of your problem on our
[issue tracker](#bug-reports--feature-requests).

### Prerequisites

- [Git](https://git-scm.com)
- [Git-LFS](https://git-lfs.github.com)
- [Node](https://nodejs.org/en) version 18 or greater.
  - We recommend installing node using [nvm](https://github.com/nvm-sh/nvm#intro).
    Our install script can install this for you if you don't already have it.
- [Docker](https://www.docker.com/products/docker-desktop)

### Run Locally

1. Clone the `waterthetrees` parent repo and enter the directory.

    ```shell
    git clone https://github.com/waterthetrees/waterthetrees.git
    cd waterthetrees
    ```

2. Run the script to clone the project's repos.

    ```shell
    ./clone_repos.sh
    ```

3. For easy install, run the install script.

    ```shell
    ./install.sh
    ```

    Otherwise, you will need to manually set up the backend and frontend.

    Set up the backend:
    - Go into the `wtt_server` directory.
    - Install the node modules.
    - Create the `.env` file.
    - Return to the root `waterthetrees` directory.

    ```shell
    cd wtt_server
    cp .env.example .env
    npm install
    cd ..
    ```

    Set up the frontend:
    - Go into the `wtt_front` directory.
    - Install the node modules.
    - Return to the root `waterthetrees` directory.

    ```shell
    cd wtt_front
    npm install
    cd ..
    ```

4. The database config is passed into our backend server using
[environment variables](https://github.com/waterthetrees/wtt_server/blob/development/server/db/db-config.js#L8-L12).
You will need to ask a team member to provide you with the environment variables
(Try our [Slack channel](#join-us)). Paste the contents into the `wtt_server/.env` file.

    Your file tree structure should look something like this.

    <pre>
    waterthetrees
    |
    └───wtt_front
    |   │   ...
    |
    └───wtt_server
    │   │   <b>.env</b>
    |   |   .env.example
    │   │
    │   └───server
    │       │   ...
    |
    └───wtt_db
    |   |
    │   └───treeddb.sql
    │
    |   ...
    </pre>

5. Start the database.

    In the root `waterthetrees` directory, run:

    ```shell
    docker compose up
    ```

    When you want to stop the database, run:

    ```shell
    docker compose down
    ```

6. Start the backend.

    Go into the `wtt_server` directory.

    ```shell
    cd wtt_server
    ```

    Open another terminal tab. Then run the following to start the backend.

    ```shell
    npm run start
    ```

7. Start the frontend.

    Go into the `wtt_front` directory.

    ```shell
    cd wtt_front
    ```

    Open another terminal tab. Then run the following to start the frontend and
    open it in the browser.

    ```shell
    npm run start:dev
    open http://localhost:3000
    ```

    When you want to stop the frontend, press `Ctrl + C` in the terminal.

## Contributing

Start by reading the
[onboarding guide](https://github.com/waterthetrees/waterthetrees/wiki/Onboarding).

### Join Us

Join the [#proj-waterthetrees Slack channel](https://sfbrigade.slack.com/messages/C010EGACUTU) directly.

or

Join the [Code for San Francisco Slack](https://c4sf.me/slack) and search for
the `#proj-waterthetrees` channel.

### Development

1. Check the [issue tracker](https://github.com/orgs/waterthetrees/projects/2)
to find a feature to build or enhance, a bug that needs fixing, and more.

2. Create a new branch.

    ```shell
    git checkout -b github-username/feature/build-new-feature
    ```

3. Make the appropriate changes in the files, making sure to follow our
[Code Conventions](https://github.com/waterthetrees/waterthetrees/wiki/Code-Conventions).

4. Commit your changes.

    ```shell
    git commit -am 'Build new feature'
    ```

5. Push to the branch.

    ```shell
    git push origin github-username/feature/build-new-feature
    ```

6. Create a Pull Request.

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/orgs/waterthetrees/projects/2)
to report any bugs or file feature requests.
