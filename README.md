# XSpec Gradle Template

This is a template for projects that use [XSpec](https://github.com/xspec/xspec), [Gradle](https://gradle.org/), and [GitHub](https://github.com/) or [GitLab](https://gitlab.com/).

XSpec is a unit test and behaviour-driven development (BDD) framework for XSLT, XQuery, and Schematron.

Gradle is a build tool that provides dependency management.

GitHub and GitLab provide code repository hosting and continuous integration services.

With their powers combined they are a great aid for developing and testing in projects that use XSLT, Schematron, and XQuery.

## Usage

### Step 0: Initial setup

If you are starting from scratch, ensure that you have Git and Gradle installed. There plenty of instructional resources available that explain how to install Git and Gradle.

If starting a new project, create a folder for the project and then inside the project folder run:

    git init
    gradle wrapper init

When prompted, choose project type "basic" and build script DSL "groovy".

In GitHub or GitLab, create a new project. Then copy the Clone URL (either SSH or HTTP) and inside the project folder run:

    git remote add origin <gitlab-clone-url>

### Step 1: XSpec

Add your own XSLT, Schematron or XQuery files that are part of your project.

Add your own XSpec files that are part of your project.

Any file whose name ends with ".xspec" will be executed by XSpec when Gradle runs tests. Ensure that your XSpec files are named accordingly.

* A file name ending with "sch.xspec" will be run as XSpec Schematron test.
* A file name ending with "xq.xspec" will be run as XSpec XQuery test.
* Otherwise, a file name ending with ".xspec" will be run as XSpec XSLT test.

### Step 2: Gradle

Copy the contents of `build.gradle` into the `build.gradle` file for your project. Take care to place the declarations that appear at the start of the file into the relevant sections of your projects' `build.gradle` file.

If your project uses an XML Catalog for resolving dependencies to local copies of resources (e.g. DTD files) set the `xmlCatalog` property to the location of the XML Catalog file.

To run all XSpec tests before committing changes to git run `gradlew xspec_test` or `gradlew test`.

On Windows, at the command line run:

    .\gradlew.bat xspec_test

On Linux:

    ./gradlew xspec_test

If either "test" or "xspec_test" are included in the `defaultTasks` setting of your `build.gradle` file you can just click on `gradlew.bat` or `gradlew` to run the XSpec tests.

XSpec will save its test reports in folders named `xspec` with files named `*-result.html` and `*-junit.xml` based on the location and file name of the XSpec file.

If you want to run individual XSpec files using Gradle (instead of running all XSpec files using the `xspec_test` Gradle task), run `gradlew tasks` to see a list that shows the Gradle task name that corresponds to each XSpec file, and then run the task for the desired XSpec file. For example, to run `src/examples/xslt/test.xspec` using Gradle:

    gradlew examples_xslt_test.xspec

The build script will automatically download and run the version of XSpec that is specified in `xspecVersion` in `build.gradle`. If desired, a different local copy of XSpec can be used instead by providing the file path to the XSpec command as a parameter to Gradle:

    gradlew -PxspecCmd=/path/to/xspec/bin/xspec.sh

### Step 3: GitHub Actions or GitLab CI

For GitHub Actions, copy the `.github\workflows\ci-tests.yml` script file or copy the relevant parts of this file into a similar GitHub Actions script for your project.

For GitLab CI, copy the contents of `.gitlab-ci` into the relevant parts of the `.gitlab-ci` file for your project.

Add and commit these changes to git.

When you push changes to GitHub or GitLab the XSpec tests will be run automatically.

To see the status of the automated tests, in GitHub navigate to the Actions tab or in GitLab navigate to the CI Jobs page.
