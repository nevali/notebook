# Ding!

1. Simple scene loader
  * [x] XML-based scene format, specifies primitive (including lights) locations and scales only
  * [x] Just parses and outputs
  * [x] Autotools
  * [x] Travis CI
  * [x] Add XML namespace
  * [ ] l10n with expanded error messages containing explanations (simplified fallbacks in code)
2. ~Composite (group) objects~
3. ~Primitive transforms & translation~
4. Group transforms & translations
5. Includes/reuse of composite obects (via `xlink:href` and `xml:id`)
  * [x] Reference-counted scene objects
  * [ ] Unresolved object dereferencing pass
  * [ ] Copy constructors/duplicators
6. SDL-based scene viewer
  * Fixed camera & viewport/FOV scale
  * Cross-platform skeleton (generate Xcode and VS projects)
7. Simple colour shading of primitives
8. Shaded/wireframe toggle
9. Keyboard/mouse camera movement
10. Model loading
  * [Assimp](http://assimp.sourceforge.net)?
11. Texture loading
12. Add a skybox/skydome
13. Configurable cameras (first- vs third-person vs overhead, for example) and a camera cycle key
  * Cameras can be fixed or _track_ - a tracking camera is transformed or translated whenever an object which is tracking it does based upon scene-defined adjustments
14. Scene inheritance: load all of the objects from a base scene, then extend it with additional objects
15. Physics and collisions
  * [Bullet](https://github.com/bulletphysics/bullet3)
  * Wrap the camera in a physics capsule so the 'player' can collide
16. Animated models
17. Optional raycasting mode
  * May operate independently of camera if there are sufficient input sources (e.g., if a gyroscope and touchscreen are available, the gyro could be used to alter camera, and a touch to trigger raycasting)
19. Trigger a visual effect when collisions or raycast occur
19. Audio (play a sound when a collision occurs)
20.  Add a "goal" objects which can be collided-with to end the scene
21. Add an optional countdown timer
22. Add optional score-keeping
23. Move object behaviours (keep score, play sound, add visual effect, etc.) into Lua
24. Ability to load assets, including scene XML, Lua and textures from packages (ZIP files)
25. Fork into Ding! from Scene Viewer
  * Remove hotkeys for shaded/wireframe, camera flythrough, etc.
26. Add global states
27. Add progression (a goal or timer expiry leads to another scene)
28. Add scene music
29. Add high-scores
30. Split into Arcade (timed) and Peaceful (untimed, but objects may only be collided with a certain number of times) modes
31. Add health to Arcade mode and health-influencing (damaging and enhancing) objects
32. Add damaging NPC objects which pathfind and have their _own_ health
