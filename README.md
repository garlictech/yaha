# Yaha

[![iOS DEV app](https://build.appcenter.ms/v0.1/apps/632fc135-5359-468f-98e0-d29445363745/branches/dev/badge)](https://appcenter.ms)

This project was generated using [Nx](https://nx.dev).

## General knowledge

The system supports building and deploying separate stacks for development and
testing purposes. You have to configure and build these stacks, according to the
sections below. The configuration and build commands generally support `app` and
`stage` flags. The `app` is an unique identification of your stack. The stage is
important as the app uses some stage-dependent externally configured resources
(like secrets). The stage specifies which resource set is used.
There are three stages: `dev`, `qa`, `producton`.

Currently, only the `dev` stage is available. You should almost always use the `dev` stage.

The app name for production is currently `yaha`, the backend subproject is `backend`. Don't overwrite them
please :)

## Pre-requisites

Install the following tools:

- AWS CLI - [install](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html) [configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html)
- The following command line tools: `jq` - [install](https://stedolan.github.io/jq/)

## Configuring/building the project

Use the `config` build targets for projects requiring configuration.
Use the `build` build targets for projects requiring build/code generation.

**the whole project**

At this point we use [hygen](https://www.hygen.io/) to generate those project files
that contains app names or stage names in theit content and cannot be parametrized
by any other ways.

```
 yarn hygen project configure --app=my-app-name
```

Mind, that the app names must be consistent througout the project, for example:

```
 yarn hygen project configure --app=yaha
```

TRICK: to force overwrite files:

```
HYGEN_OVERWRITE=1 yarn hygen project configure --app yaha-zsolt
```

**important**:
The `tools/build-workspace.sh` script supports this part, so it generates the project
for you. The safest option is using this script.

**the configs (and secrets)**

`nx config shared-config --app=APPNAME --stage=dev` :exclamation: use your own app name

Always add the parameters, there are no defaults supported!

Execute this command when:

- you clone the github repo
- any config parameters change in the AWS Parameter Store or AWS Secret Manager
- you change the project stage (dev, production, qa)

The command fetches the config parameters and writes them into files in
`libs/shared/config`, `apps/mobile_app/lib/awsconfiguration.dart`, etc. You need AWS credentials set in your environment with the
appropriate access!

**IMPORTANT**

Ensure that the generated files are NOT checked in to github. They are gitignored by default, don't remove those ignores.

Always check the invoked scripts for their internals and parameters!

## How to code

- [Functional data types in Flutter](wiki/Functional-programming-in-YAHA)

## The nx stuff

<p style="text-align: center;"><img src="https://raw.githubusercontent.com/nrwl/nx/master/images/nx-logo.png" width="450"></p>

🔎 **Powerful, Extensible Dev Tools**

## Adding capabilities to your workspace

Nx supports many plugins which add capabilities for developing different types of applications and different tools.

These capabilities include generating applications, libraries, etc as well as the devtools to test, and build projects as well.

Below are our core plugins:

- [React](https://reactjs.org)
  - `npm install --save-dev @nrwl/react`
- Web (no framework frontends)
  - `npm install --save-dev @nrwl/web`
- [Angular](https://angular.io)
  - `npm install --save-dev @nrwl/angular`
- [Nest](https://nestjs.com)
  - `npm install --save-dev @nrwl/nest`
- [Express](https://expressjs.com)
  - `npm install --save-dev @nrwl/express`
- [Node](https://nodejs.org)
  - `npm install --save-dev @nrwl/node`

There are also many [community plugins](https://nx.dev/nx-community) you could add.

## Generate an application

Run `nx g @nrwl/react:app my-app` to generate an application.

> You can use any of the plugins above to generate applications as well.

When using Nx, you can create multiple applications and libraries in the same workspace.

## Generate a library

Run `nx g @nrwl/react:lib my-lib` to generate a library.

> You can also use any of the plugins above to generate libraries as well.

Libraries are shareable across libraries and applications. They can be imported from `@yaha/mylib`.

## Development server

Run `nx serve my-app` for a dev server. Navigate to http://localhost:4200/. The app will automatically reload if you change any of the source files.

## Code scaffolding

Run `nx g @nrwl/react:component my-component --project=my-app` to generate a new component.

## Build

Run `nx build my-app` to build the project. The build artifacts will be stored in the `dist/` directory. Use the `--prod` flag for a production build.

## Running unit tests

Run `nx test my-app` to execute the unit tests via [Jest](https://jestjs.io).

Run `nx affected:test` to execute the unit tests affected by a change.

## Running end-to-end tests

Run `ng e2e my-app` to execute the end-to-end tests via [Cypress](https://www.cypress.io).

Run `nx affected:e2e` to execute the end-to-end tests affected by a change.

## Understand your workspace

Run `nx dep-graph` to see a diagram of the dependencies of your projects.

## Further help

Visit the [Nx Documentation](https://nx.dev) to learn more.

## ☁ Nx Cloud

### Computation Memoization in the Cloud

<p style="text-align: center;"><img src="https://raw.githubusercontent.com/nrwl/nx/master/images/nx-cloud-card.png"></p>

Nx Cloud pairs with Nx in order to enable you to build and test code more rapidly, by up to 10 times. Even teams that are new to Nx can connect to Nx Cloud and start saving time instantly.

Teams using Nx gain the advantage of building full-stack applications with their preferred framework alongside Nx’s advanced code generation and project dependency graph, plus a unified experience for both frontend and backend developers.

Visit [Nx Cloud](https://nx.app/) to learn more.
