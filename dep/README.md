If you are building dependencies, it is necessary for at least glew, jansson, and speexdsp to enter their directories and perform the necessary configuration steps. Please see their READMEs for the proper steps.

# glew
You must run `make extensions`

# jansson
You must run `autoreconf -i`, then `./configure`, and possibly adjust the `janssson_private_config.h` file for your system.

# speexdsp
You must run `./autogen.sh`, then `./configure`, and possibly adjust the `config.h` file for your system, at least setting `FLOATING_POINT` to `1` from `/**/`.