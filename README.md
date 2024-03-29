# Particle Clash

_A match-4 game for two players about particles about to collide_

## Ludum Dare 51: Compo entry

[![Overall: 3.4](https://img.shields.io/badge/overall-3.4-yellowgreen) 
![Fun: 3.2](https://img.shields.io/badge/fun-3.2-yellowgreen) 
![Innovation: 3.4](https://img.shields.io/badge/innovation-3.4-yellowgreen) 
![Theme: 3.5](https://img.shields.io/badge/theme-3.5-yellowgreen) 
![Graphics: 2.9](https://img.shields.io/badge/graphics-2.9-yellow) 
![Audio: 3.0](https://img.shields.io/badge/audio-3.0-yellowgreen) 
![Humor: 2.3](https://img.shields.io/badge/humor-2.3-yellow)
![Mood: 2.9](https://img.shields.io/badge/mood-2.9-yellow)](https://ldjam.com/events/ludum-dare/51/$303236/)

## About

Two particles will collide **every 10 seconds**, and only one of them may survive.

**Twist** the matter inside to create colored lines of **4 or more subparticles of the same color**, strengthening your particle, and prepare for the crash: the strongest particle wins the round!

### Requirements

This game requires:

- A screen with a resolution of **1600x900 pixels or greater** 
- **2 local players** _(call a friend and play together!)_
- **full color vision** _(sorry color blind friends...)_

### Screenshot

![Screenshot of the first level with the default colors](media/screenshot-1.png "Screenshot of the first level with the default colors")

### Controls

#### Player 1

- \[**W**\] \[**A**\] \[**S**\] \[**D**\] - Move
- \[**Space**\] - Rotate clockwise

#### Player 2

- \[**↑**\] \[**←**\] \[**↓**\] \[**→**\] - Move
- \[**Enter**\] - Rotate clockwise

#### Common

- **Mouse** - Select options on the menu
- **`M`** - Mute music
- **`N`** - Mute sounds

## Credits

### Game

- Stefano Pigozzi (@Steffo99)

### Tools

- [⚙️ Godot Engine `3.5.1`](https://godotengine.org/)
- [💻 Visual Studio Code](https://code.visualstudio.com/)
	- [`geequlim.godot-tools` extension](https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools)
	- [`ms-vsliveshare.vsliveshare` extension](https://marketplace.visualstudio.com/items?itemName=ms-vsliveshare.vsliveshare)
- [✏️ GIMP `2.10.32`](https://www.gimp.org/)
- [🎵 REAPER `6.61`](https://www.reaper.fm/)
- [🏗️ Git](https://git-scm.com/)
	- [Git Large File Storage extension](https://git-lfs.github.com/)
- [🏗️ GitHub](https://github.com/)
	- [GitHub Actions](https://github.com/features/actions)
		- [`abarichello/godot-ci` action](https://github.com/marketplace/actions/godot-ci)
- [🏗️ `Steffo99/template-godot-ld50` template](https://github.com/Steffo99/template-godot-ld50)

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
1. Push a new tag with formatted as `vX.Y.Z`

To download the resulting builds:

1. Visit the Actions tab
1. Click on the triggered workflow
1. Download the created artifacts from the bottom of the page

> Note that artifacts are visible only if you're logged in to a GitHub account!
