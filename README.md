# code-test

## Requirements

- docker
  https://docs.docker.com/engine/install/

- docker-compose
  https://docs.docker.com/compose/install/

## Running this project

After you have the requirements just need to build and run the docker container:

- To build the project
  `docker-compose build`

- To run the project
  `docker-compose up -d`

- To run all tests
  `docker-compose run app rspec`

## Description

- Refactored built following Factory Method
- Product Class is the creator class were product specific class is chosen
- Any unrecognized product type will follow Default Product class specifications
