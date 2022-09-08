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
development and testing purposes. They have been tested on macOS and
[WSL](https://docs.microsoft.com/en-us/windows/wsl) in Windows, so YMMV with
non-WSL Windows and Linux. If you encounter any trouble with these instructions
please create an issue with the details of your problem on our
[issue tracker](#bug-reports--feature-requests).

### Prerequisites

- [Git](https://git-scm.com) and [Git-LFS](https://git-lfs.github.com)
- [Node](https://nodejs.org/en) version 18 or greater.
  - We recommend installing node using [nvm](https://github.com/nvm-sh/nvm#intro).
- [Docker](https://www.docker.com/products/docker-desktop)

### Run Locally

1. Clone the waterthetrees parent repo and enter the directory.

    ```shell
    git clone https://github.com/waterthetrees/waterthetrees.git
    cd waterthetrees
    ```

2. Run the script to clone and install packages on all other repos.

    ```shell
    ./clone_repos.sh
    ./install.sh
    ```

3. The database config is passed into our backend server using
[environment variables](https://github.com/waterthetrees/wtt_server/blob/development/server/db/db-config.js#L8-L12).
You will need to ask a team member to provide you with the environment variables
(Try our [Slack channel](#join-us)).


    Your file tree structure should look like this.

    <pre>
    waterthetrees
    |
    └───wtt_front
    |   │   ...
    |
    └───wtt_server
    │   │   <b>.env</b>
    │   │   README.md
    │   │
    │   └───server
    │       │   ...
    |
    └───wtt_db
    │   └───treeddb.sql
    │    ...
    </pre>

In the `waterthetrees` directory, run:

```shell
docker compose up
```

When you want to stop the backend services, run:

```shell
docker compose down
```

4. Start the backend services.

    Install the node modules in the `wtt_server` directory. (The install.sh script will do the install for you)
    Open a 2nd terminal window and run:

   ```shell
    ./install.sh
    ```

   OR

   ```shell
    cd wtt_server
    ```

    ```shell
    npm install
    ```

    Ask for the .env file on slack and place it in the `wtt_server` directory.
    ```shell
    cp .env.example .env
    ```

    Then run:

    ```shell
    npm run start
    ```


5. Start the frontend.

    Install the node modules in the `wtt_front` directory. (The install.sh script will do the install for you)
    Open a 3rd terminal window and run.
    If you already have run the install script, just start with npm run start.

    ```shell
    ./install.sh
    ```

    OR

    ```shell
    cd wtt_front
    ```

    ```shell
    npm install
    ```

    ```shell
    npm run start:dev; 
    open http://localhost:3000;
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
