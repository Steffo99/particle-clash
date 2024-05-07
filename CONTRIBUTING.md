# Contribution notes

## Large file storage

This repository is configured with the [Git Large File Storage extension](https://git-lfs.github.com/).

### Cloning

To clone this repository with all LFS files:

1. Ensure Git LFS is installed on your system

1. Clone the repository normally

1. Run:
	```console
	$ git lfs pull
	```

### Committing

Before you commit a large binary file (such as an image, or an audio file):

1. Ensure the Git LFS hooks are installed:
	```console
	$ git lfs install
	```

1. Ensure the extension of the file you are committing [is tracked](.gitattributes):
	```console
	$ git lfs track "*.ext"
	```

1. Ensure the `.gitattributes` file itself is tracked:
	```console
	$ git add .gitattributes
	```

## Auto-build

To trigger an automatic export of the project:

1. Ensure GitHub Actions are enabled
1. Push a new tag with formatted as `vX.Y.Z`

To download the resulting builds:

1. Visit the Actions tab
1. Click on the triggered workflow
1. Download the created artifacts from the bottom of the page

> Note that artifacts are visible only if you're logged in to a GitHub account!
