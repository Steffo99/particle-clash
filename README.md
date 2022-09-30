# _untitled project_

_unknown tagline_

## Ludum Dare 50: _category_ entry

[![Overall: TBD](https://img.shields.io/badge/overall-TBD-lightgrey) 
![Fun: TBD](https://img.shields.io/badge/fun-TBD-lightgrey) 
![Innovation: TBD](https://img.shields.io/badge/innovation-TBD-lightgrey) 
![Theme: TBD](https://img.shields.io/badge/theme-TBD-lightgrey) 
![Graphics: TBD](https://img.shields.io/badge/graphics-TBD-lightgrey) 
![Audio: TBD](https://img.shields.io/badge/audio-TBD-lightgrey) 
![Humor: TBD](https://img.shields.io/badge/humor-TBD-lightgrey)
![Mood: TBD](https://img.shields.io/badge/mood-TBD-lightgrey)](YOUR-GAME-URL-HERE)

## Credits

### Game

- Your name goes here!

### Tools

- [Godot Engine `3.4.4`](https://godotengine.org/)
- [Visual Studio Code](https://code.visualstudio.com/)
	- [`geequlim.godot-tools` extension](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)
	- [`ms-vsliveshare.vsliveshare` extension](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare)
- [`Steffo99/template-godot-ld50` template](https://github.com/Steffo99/template-godot-ld50)
- [Git](https://git-scm.com/)
	- [Git Large File Storage extension](https://git-lfs.github.com/)
- [GitHub](https://github.com/)
	- [GitHub Actions](https://github.com/features/actions)
		- [`abarichello/godot-ci` action](https://github.com/marketplace/actions/godot-ci)

## Development

### Large file storage

This repository is configured with the [Git Large File Storage extension](https://git-lfs.github.com/).

#### Cloning

To clone this repository with all LFS files:

1. Ensure Git LFS is installed on your system

1. Clone the repository normally

1. Run:
	```console
	$ git lfs pull
	```

#### Committing

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

### Auto-build

To trigger an automatic export of the project:

1. Ensure GitHub Actions are enabled
1. Create a new GitHub Release

To download the resulting builds:

1. Visit the Actions tab
1. Click on the triggered workflow
1. Download the created artifacts from the bottom of the page

> Note that artifacts are visible only if you're logged in to a GitHub account!
