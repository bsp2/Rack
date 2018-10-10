#
# Common plugin makefile for "msvc" / win32 target
#
#  Also see plugin_common.mk

#
#
# In order to extend existing targets, add 
# your targets to the
#
#       HELP_RULES - extends "help" target
#    INSTALL_RULES - extends "install" target
#        BIN_RULES - extends "bin" target
#    BIN_POST_EVAL - evaluated after building "bin" target
#      CLEAN_RULES - extends "clean" target
#  REALCLEAN_RULES - extends "realclean" target
#
# variables  
#
#


#
# Determine TARGET filename if only TARGET_BASENAME name is known
#
ifeq ("$(TARGET)","")
TARGET=$(TARGET_BASENAME).so
endif

CPPFLAGS += -I"/usr/include/gtk-2.0/"
CPPFLAGS += -I"/usr/lib/gtk-2.0/include/"
CPPFLAGS += -I"/usr/include/glib-2.0/"
CPPFLAGS += -I"/usr/lib/glib-2.0/include/"
CPPFLAGS += -I"/usr/include/cairo/"
CPPFLAGS += -I"/usr/include/pango-1.0/"
CPPFLAGS += -I"/usr/include/gdk-pixbuf-2.0/"
CPPFLAGS += -I"/usr/include/atk-1.0/"
CPPFLAGS += -I"dep/yac"
CPPFLAGS += -shared -fPIC
CPPFLAGS += $(EXTRAFLAGS)
EXTRALIBS +=

#
# Build plugin library
#
.PHONY: bin
bin: $(BIN_RULES) $(ALL_OBJ) 
	$(LD) $(ALL_OBJ) $(EXTRALIBS) -o $(TARGET)
	@echo "Build finished at `date +%H:%M`."
	@ls -l $(TARGET)
	$(call BIN_POST_FXN)
#	$(foreach postfxn,$(BIN_POST_FXNS),$(call $(postfxn)))
#	@echo "done"


.cpp.o:
	$(CC) $(CPPFLAGS) $(OPTFLAGS_PLUGIN) -c "$<" -o "$@"

.c.o:
	$(CC) $(CPPFLAGS) $(OPTFLAGS_PLUGIN) -c "$<" -o "$@"


#
# Install plugin
#  (Note: cannot depend on "bin" target since this would overwrite the UPX compressed file..)
#
install: $(INSTALL_RULES)
#	$(CP) $(TARGET) "$(TKS_SITE_PREFIX)/plugins/"
#	@echo "[...] $(TARGET) installed to \"$(TKS_SITE_PREFIX)/plugins/\".";
	@echo "skip install"



#
# Make clean and remove backup files
#
.PHONY: realclean
realclean: $(REALCLEAN_RULES) clean
	$(RM) `$(FIND) . -name \*\~` $(TARGET) *.exp *.lib *.plg *.ncb *.map *.manifest


#
# Remove object files and targets.
#
.PHONY: clean
clean: $(CLEAN_RULES)
	@echo "[...] cleaning up.."
	$(RM) $(ALL_OBJ) $(TARGET)
