#
# Makefile for VCV rack lib + Microsoft Visual C++ 2003 / 2005 / 2008 / 2017 ToolKit
# 
#

NUM_JOBS=$(NUMBER_OF_PROCESSORS)

.PHONY:
bin: vst

.PHONY:
lib:
	make -f makefile_lib bin -j $(NUM_JOBS)

.PHONY:
shared_lib:
	make -f makefile_shared_lib bin -j $(NUM_JOBS)

.PHONY:
vst: lib
	rm -f src/vst2_main.o
	make -f makefile_vst_instr bin -j $(NUM_JOBS)
	rm -f src/vst2_main.o
	make -f makefile_vst_effect bin -j $(NUM_JOBS)
# (note) cannot use both instrument and effect plugin at the same time!
	mv veeseevstrack_instr.so vst2_bin/
	mv veeseevstrack_effect.so vst2_bin/
	@ls -l vst2_bin/veeseevstrack_instr.so
	@ls -l vst2_bin/veeseevstrack_effect.so

clean:
	make -f makefile_lib clean
	make -f makefile_shared_lib clean
	make -f makefile_vst_instr clean
	make -f makefile_vst_effect clean

.PHONY: dep
dep:
	make -C dep/ -f Makefile -j $(NUM_JOBS) bin

.PHONY: dep.install
dep.install:
	make -C dep/ -f Makefile install

.PHONY: dep.clean
dep.clean:
	make -C dep/ -f Makefile clean

PLUGINS:= Fundamental AudibleInstruments

# "never, ever, build a make system that relies on recursive make invocations."

define run_make
	make -C "plugins/community/repos/$(1)" -f makefile.vsvst $(2) -j $(NUM_JOBS)
endef

.PHONY: plugin
plugin:
#	$(foreach pname,$(PLUGINS),$(eval ($(call run_make,$(pname),bin))))
	$(call run_make,21kHz,bin)
	$(call run_make,AmalgamatedHarmonics,bin)
	$(call run_make,Alikins,bin)
	$(call run_make,alto777_LFSR,bin)
	$(call run_make,AS,bin)
	$(call run_make,AudibleInstruments,bin)
	# $(call run_make,Autodafe,bin) # SEQ8/SEQ16 issues
	$(call run_make,BaconMusic,bin)
	$(call run_make,Befaco,bin)
	$(call run_make,Bidoo,bin)
	$(call run_make,Bogaudio,bin)
	# $(call run_make,bsp,bin) # linking issues
#	$(call run_make,BOKONTEPByteBeatMachine,bin)
	$(call run_make,CastleRocktronics,bin)
	# $(call run_make,cf,bin) # defined and issues
	$(call run_make,com-soundchasing-stochasm,bin)
	$(call run_make,computerscare,bin)
	# $(call run_make,dBiz,bin) # linking issues
	$(call run_make,DHE-Modules,bin)
	$(call run_make,DrumKit,bin)
	$(call run_make,ErraticInstruments,bin)
	$(call run_make,ESeries,bin)
	$(call run_make,FrankBussFormula,bin)
	$(call run_make,FrozenWasteland,bin)
	$(call run_make,Fundamental,bin)
	$(call run_make,Geodesics,bin)
	$(call run_make,Gratrix,bin)
	$(call run_make,HetrickCV,bin)
	$(call run_make,huaba,bin)
	$(call run_make,ImpromptuModular,bin)
	$(call run_make,JE,bin)
	$(call run_make,JW-Modules,bin)
	$(call run_make,Koralfx-Modules,bin)
	$(call run_make,LindenbergResearch,bin)
	$(call run_make,LOGinstruments,bin)
	$(call run_make,mental,bin)
	$(call run_make,ML_modules,bin)
	$(call run_make,moDllz,bin)
	$(call run_make,modular80,bin)
	$(call run_make,mscHack,bin)
	$(call run_make,mtsch-plugins,bin)
	$(call run_make,NauModular,bin)
	$(call run_make,Nohmad,bin)
	$(call run_make,Ohmer,bin)
#	$(call run_make,ParableInstruments,bin)
	$(call run_make,PG-Instruments,bin)
	$(call run_make,PvC,bin)
	$(call run_make,Qwelk,bin)
	$(call run_make,RJModules,bin)
	$(call run_make,SerialRacker,bin)
	$(call run_make,SonusModular,bin)
	$(call run_make,Southpole,bin)
	$(call run_make,Southpole-parasites,bin)
	$(call run_make,squinkylabs-plug1,bin)
	$(call run_make,SubmarineFree,bin)
	$(call run_make,SynthKit,bin)
	$(call run_make,Template,bin)
	# $(call run_make,Template_shared,bin) # linking issues
	$(call run_make,TheXOR,bin)
	$(call run_make,trowaSoft,bin)
	$(call run_make,unless_modules,bin)
	$(call run_make,Valley,bin)
#	$(call run_make,VultModules,bin)

.PHONY: plugin.clean
plugin.clean:
#	$(foreach pname,$(PLUGINS),$(eval $(call run_make,$(pname),clean)))
#	$(foreach pname,$(PLUGINS),$(eval echo $(pname)))
	$(call run_make,21kHz,clean)
	$(call run_make,AmalgamatedHarmonics,clean)
	$(call run_make,Alikins,clean)
	$(call run_make,alto777_LFSR,clean)
	$(call run_make,AS,clean)
	$(call run_make,AudibleInstruments,clean)
	$(call run_make,Autodafe,clean)
	$(call run_make,BaconMusic,clean)
	$(call run_make,Befaco,clean)
	$(call run_make,Bidoo,clean)
	$(call run_make,Bogaudio,clean)
	$(call run_make,bsp,clean)
#	$(call run_make,BOKONTEPByteBeatMachine,clean)
	$(call run_make,CastleRocktronics,clean)
	$(call run_make,cf,clean)
	$(call run_make,com-soundchasing-stochasm,clean)
	$(call run_make,computerscare,clean)
	$(call run_make,dBiz,clean)
	$(call run_make,DHE-Modules,clean)
	$(call run_make,DrumKit,clean)
	$(call run_make,ErraticInstruments,clean)
	$(call run_make,ESeries,clean)
	$(call run_make,FrankBussFormula,clean)
	$(call run_make,FrozenWasteland,clean)
	$(call run_make,Fundamental,clean)
	$(call run_make,Geodesics,clean)
	$(call run_make,Gratrix,clean)
	$(call run_make,HetrickCV,clean)
	$(call run_make,huaba,clean)
	$(call run_make,ImpromptuModular,clean)
	$(call run_make,JE,clean)
	$(call run_make,JW-Modules,clean)
	$(call run_make,Koralfx-Modules,clean)
	$(call run_make,LindenbergResearch,clean)
	$(call run_make,LOGinstruments,clean)
	$(call run_make,mental,clean)
	$(call run_make,ML_modules,clean)
	$(call run_make,moDllz,clean)
	$(call run_make,modular80,clean)
	$(call run_make,mscHack,clean)
	$(call run_make,mtsch-plugins,clean)
	$(call run_make,NauModular,clean)
	$(call run_make,Nohmad,clean)
	$(call run_make,Ohmer,clean)
#	$(call run_make,ParableInstruments,clean)
	$(call run_make,PG-Instruments,clean)
	$(call run_make,PvC,clean)
	$(call run_make,Qwelk,clean)
	$(call run_make,RJModules,clean)
	$(call run_make,SerialRacker,clean)
	$(call run_make,SonusModular,clean)
	$(call run_make,Southpole,clean)
	$(call run_make,Southpole-parasites,clean)
	$(call run_make,squinkylabs-plug1,clean)
	$(call run_make,SubmarineFree,clean)
	$(call run_make,SynthKit,clean)
	$(call run_make,Template,clean)
	$(call run_make,Template_shared,clean)
	$(call run_make,TheXOR,clean)
	$(call run_make,trowaSoft,clean)
	$(call run_make,unless_modules,clean)
	$(call run_make,Valley,clean)
#	$(call run_make,VultModules,clean)
