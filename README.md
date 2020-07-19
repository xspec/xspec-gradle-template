# XSpec Gradle

This is a template for projects that use [XSpec](https://github.com/xspec/xspec), [Gradle](https://gradle.org/), and [GitLab](https://gitlab.com/). 

XSpec is a unit test and behaviour-driven development (BDD) framework for XSLT, XQuery, and Schematron.

Gradle is a build tool that provides dependency management.

GitLab is a code repository hosting and continuous integration service.

With their powers combined they are a great aid for developing and testing in projects that use XSLT, Schematron, and XQuery.

## Usage

Gradle: Copy the contents of `build.gradle` into the `build.gradle` file for your project, taking care to place the declarations that appear at the start of the file into the relevant sections of your projects' `build.gradle` file.

GitLab: Copy the contents of `.gitlab-ci` into the relevant parts of the `.gitlab-ci` file for your project.

XSpec: add your own XSpec files. 

To run all XSpec tests before committing changes to git run gradle tests.

On Windows:

    .\gradlew.bat clean test

On Linux:

    .\gradlew clean test

When you push changes to GitLab the XSpec tests will be run automatically.
