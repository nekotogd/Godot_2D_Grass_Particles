# 2D Grass Particles

Just a prototype idea that I briefly showcased in [this video](https://www.youtube.com/watch?v=X7t3arcWNdc)

![image](https://user-images.githubusercontent.com/81257780/176516477-d21ed323-6a50-4944-bd6c-497c1881236f.png)

## Concept

Made of 2 shaders, a particle shader and a fragment+vertex shader

### Particle Shader
- Places grass instances in a grid using their `INDEX`
- Spaces them according to `spacing` uniform
- Passes the world position of the particle to the fragment+vertex shader

### Fragment and Vertex Shader
- Calculates a circle around the player position
- Stomp animation for anything within that circle
- Kinda fades it towards the edges of the circle
- Rotates the vertices according to the wind
- Uses the world position to select a random sprite from a spritesheet
- Colors the top and bottom of the grass

### No Credit needed but like [drop a sub](https://www.youtube.com/c/NekotoArts) for me plz?
