/*
Copyright (c) 2017 Leonardo Laguna Ruiz (modlfo@gmail.com), All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1.- Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
2.- Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
3.- Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
4.- Commercial use requires explicit permission of the author.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#include <math.h>
#include "VultModules.hpp"

float getSampleRate()
{
   return engineGetSampleRate();
}

RACK_PLUGIN_MODEL_DECLARE(VultModules, Rescomb);
RACK_PLUGIN_MODEL_DECLARE(VultModules, Stabile);
RACK_PLUGIN_MODEL_DECLARE(VultModules, Lateralus);
RACK_PLUGIN_MODEL_DECLARE(VultModules, Debriatus);
RACK_PLUGIN_MODEL_DECLARE(VultModules, Splie);
RACK_PLUGIN_MODEL_DECLARE(VultModules, Trummor);
RACK_PLUGIN_MODEL_DECLARE(VultModules, Tohe);
RACK_PLUGIN_MODEL_DECLARE(VultModules, Tangents);

RACK_PLUGIN_INIT(VultModules) {
   RACK_PLUGIN_INIT_ID();

	RACK_PLUGIN_MODEL_ADD(VultModules, Rescomb);
   RACK_PLUGIN_MODEL_ADD(VultModules, Stabile);
   RACK_PLUGIN_MODEL_ADD(VultModules, Lateralus);
   RACK_PLUGIN_MODEL_ADD(VultModules, Debriatus);
   RACK_PLUGIN_MODEL_ADD(VultModules, Splie);
   RACK_PLUGIN_MODEL_ADD(VultModules, Trummor);
   RACK_PLUGIN_MODEL_ADD(VultModules, Tohe);
   RACK_PLUGIN_MODEL_ADD(VultModules, Tangents);
}