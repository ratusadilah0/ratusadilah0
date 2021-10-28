version: 2.1

executors:
  linux:
    docker:
      - image: cimg/base:2021.04
        auth:
          username: mydockerhub-user
          password: $DOCKERHUB_PASSWORD  # context / project UI env-var reference

orbs:
  node: circleci/node@2.1.0   

jobs:
  test:
    parameters:
      node-version:
        type: string
    executor: linux
    steps:
      - checkout
      - node/install:
          node-version: << parameters.node-version >>
      - run : |
               chmod +x ✨special.sh
            
workflows:
  all-test:
    jobs:
      - test:
          name: "test-10.9.0"
          node-version: 10.9.0
      - test:
          name: "test-11.9.0"
          node-version: 11.9.0
      - test:
          name: "test-12.9.0"
          node-version: 12.9.0
      - test:
          name: "test-13.9.0"
          node-version: 13.9.0
