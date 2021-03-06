
<!-- README.md is generated from README.Rmd. Please edit that file -->

# boxrdrive

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/boxrdrive)](https://CRAN.R-project.org/package=boxrdrive)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/r-box/boxrdrive/workflows/R-CMD-check/badge.svg)](https://github.com/r-box/boxrdrive/actions)

<!-- badges: end -->

The goal of boxrdrive is to make it easier to access Box from your
*local* computer, using [Box Drive](https://www.box.com/drive). This may
be useful in institutional settings, where you may not have access to a
[Box App](https://r-box.github.io/boxr/articles/boxr-apps.html), a
requirement to use [boxr](https://r-box.github.io/boxr/).

Box Drive provides you access to your Box files as a native part of your
computer’s filesystem; it relies on the same authentication method your
institution provides when you log into the Box web portal. The idea of
boxrdrive is to make it easier to compose device-independent file paths
to your local computer’s Box Drive.

Let’s say that you wish to access a file in your Box filespace. Using
Box Drive, files and folders are identified using paths,
e.g. `major_project/key_file.csv`. This path’s location on your computer
depends on its OS:

-   Windows: `C:\Users\AFauci\Box\major_project\key_file.csv`

-   MacOS: `/Users/AFauci/Box/major_project/key_file.csv`

These are the standard locations to mount Box Drive; you may have a
[custom
location](https://support.box.com/hc/en-us/articles/360043697454-Configuring-the-Default-Box-Drive-Folder-Location).

You can access Box Drive paths using:

``` r
library("boxrdrive")
box_drive("major_project", "key_file.csv")
```

On MacOS, this returns something like:

    [1] "/Users/AFauci/Box/major_project/key_file.csv"

On Windows:

    [1] "C:/Users/AFauci/Box/major_project/key_file.csv"

This package figures out if and where Box Drive is mounted to your file
system. Its main function, `box_drive()`, uses the
[fs](https://fs.r-lib.org/) package to compose an absolute path, similar
in philosophy to `here::here()`.

There is also a diagnostic function:

``` r
dr_box_drive()
```

    ✓ Box Drive installation found.
    ✓ Box Drive directory available at '/Users/AFauci/Box'.

## Caveats for shared items

One of the goals of this package is to support workflows that are
reproducible across different Box accounts. This is complicated because,
on Box, shared folders are not guaranteed to have the same paths among
different accounts.

For example, if AFauci shares the file `major_project/key_file.csv` with
KHarris, it will appear in the *root* folder of KHarris’ Box account as
`key_file.csv`; the path is no longer portable.

Furthermore, if there already exists `key_file.csv` in KHarris’ Box root
folder, it will appear in KHarris’ account as something like
`key_file.csv [AFauci]`.

To minimize path-portability problems, there are two things you can do:

-   Share only files or folders in your Box root directory.

-   Try to give the file or folder you are sharing a unique name.
    There’s no easy way to guarantee this, but do your best.

In this case, a workaround might be for AFauci to share the
`major_project` folder, as it would appear in both accounts’ root
folder. It would be helpful to give `major_project` a
sufficiently-distinct name.

Box itself uses unique identifiers for folders and files; these do not
appear to be accessible from Box Drive. If Box Drive made these
identifiers accessible, this problem could be avoided completely.

## Installation

This package is not on CRAN; you can install it from
[GitHub](https://github.com/) with:

``` r
# install.packages("remotes")
remotes::install_github("r-box/boxrdrive")
```

## Code of Conduct

Please note that the boxrdrive project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
