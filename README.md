# Motion Matching Demo

This is a small demo showing how the [Godot Motion Matching Extension](https://github.com/GuilhermeGSousa/godot-motion-matching) can be used to implement a 3rd person character controller using motion matching.

### Includes
- A player controlled character, that can switch between regular and strafe movement.
- An example of using motion matching to control AI character to move from point A to point B along a `NavigationRegion`.
- Some useful tools to help you debug and tune your motion matching settings.

### Installation
This repository already includes the compiled extension libraries. However, if you wish to use a more recent version of the extension (or compile your own), you can add the dynamic library files to the `addon/motion_matching/bin/[your platform]` forlder.
You can also download precompiled binaries from the extension's CI actions [here](https://github.com/GuilhermeGSousa/godot-motion-matching).

### Credits
- [Fire](https://github.com/fire)
- [Guilherme Sousa](https://github.com/GuilhermeGSousa)
- Demo data taken from [O3DE Motion Matching Implementation](https://github.com/o3de/o3de/tree/development/Gems/MotionMatching)
