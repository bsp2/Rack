#include "AH.hpp"

RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, Arpeggiator);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, Arpeggiator2);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, Circle);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, Imperfect);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, Imperfect2);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, Progress);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, Ruckus);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, ScaleQuantizer);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, ScaleQuantizer2);
RACK_PLUGIN_MODEL_DECLARE(AmalgamatedHarmonics, SLN);

RACK_PLUGIN_INIT(AmalgamatedHarmonics) {
   RACK_PLUGIN_INIT_ID();

   RACK_PLUGIN_INIT_WEBSITE("https://github.com/jhoar/AmalgamatedHarmonics");
   RACK_PLUGIN_INIT_MANUAL("https://github.com/jhoar/AmalgamatedHarmonics/wiki");

	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, Arpeggiator);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, Arpeggiator2);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, Circle);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, Imperfect);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, Imperfect2);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, Progress);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, Ruckus);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, ScaleQuantizer);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, ScaleQuantizer2);
	RACK_PLUGIN_MODEL_ADD(AmalgamatedHarmonics, SLN);
}
