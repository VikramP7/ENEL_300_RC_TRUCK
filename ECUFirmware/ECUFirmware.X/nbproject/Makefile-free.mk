#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-free.mk)" "nbproject/Makefile-local-free.mk"
include nbproject/Makefile-local-free.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=free
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=peripherals/CLKCTRL/CLKCTRL.c peripherals/RTC/RTC.c peripherals/SLPCTRL/SLPCTRL.c peripherals/TWI/TWI_host.c advanced_IO.c ECU_Main.c buzzer.c leds.c systemTime.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o ${OBJECTDIR}/peripherals/RTC/RTC.o ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o ${OBJECTDIR}/peripherals/TWI/TWI_host.o ${OBJECTDIR}/advanced_IO.o ${OBJECTDIR}/ECU_Main.o ${OBJECTDIR}/buzzer.o ${OBJECTDIR}/leds.o ${OBJECTDIR}/systemTime.o
POSSIBLE_DEPFILES=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d ${OBJECTDIR}/peripherals/RTC/RTC.o.d ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o.d ${OBJECTDIR}/peripherals/TWI/TWI_host.o.d ${OBJECTDIR}/advanced_IO.o.d ${OBJECTDIR}/ECU_Main.o.d ${OBJECTDIR}/buzzer.o.d ${OBJECTDIR}/leds.o.d ${OBJECTDIR}/systemTime.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o ${OBJECTDIR}/peripherals/RTC/RTC.o ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o ${OBJECTDIR}/peripherals/TWI/TWI_host.o ${OBJECTDIR}/advanced_IO.o ${OBJECTDIR}/ECU_Main.o ${OBJECTDIR}/buzzer.o ${OBJECTDIR}/leds.o ${OBJECTDIR}/systemTime.o

# Source Files
SOURCEFILES=peripherals/CLKCTRL/CLKCTRL.c peripherals/RTC/RTC.c peripherals/SLPCTRL/SLPCTRL.c peripherals/TWI/TWI_host.c advanced_IO.c ECU_Main.c buzzer.c leds.c systemTime.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-free.mk ${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=AVR128DB48
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o: peripherals/CLKCTRL/CLKCTRL.c  .generated_files/flags/free/b31e05f1167dd89ad33ad93e636859614f5c0632 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/CLKCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o -o ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o peripherals/CLKCTRL/CLKCTRL.c 
	
${OBJECTDIR}/peripherals/RTC/RTC.o: peripherals/RTC/RTC.c  .generated_files/flags/free/56abf3c7da416cf5a71b9b8a065260646411a777 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/RTC" 
	@${RM} ${OBJECTDIR}/peripherals/RTC/RTC.o.d 
	@${RM} ${OBJECTDIR}/peripherals/RTC/RTC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/RTC/RTC.o.d" -MT "${OBJECTDIR}/peripherals/RTC/RTC.o.d" -MT ${OBJECTDIR}/peripherals/RTC/RTC.o -o ${OBJECTDIR}/peripherals/RTC/RTC.o peripherals/RTC/RTC.c 
	
${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o: peripherals/SLPCTRL/SLPCTRL.c  .generated_files/flags/free/9b5eb2e5087ad9f815eb3e01f1a0e0e47babda69 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/SLPCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o.d" -MT "${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o.d" -MT ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o -o ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o peripherals/SLPCTRL/SLPCTRL.c 
	
${OBJECTDIR}/peripherals/TWI/TWI_host.o: peripherals/TWI/TWI_host.c  .generated_files/flags/free/79db20eb7c4452a9f38ad0d5a64163bbe10a42cf .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/TWI" 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_host.o.d 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/TWI/TWI_host.o.d" -MT "${OBJECTDIR}/peripherals/TWI/TWI_host.o.d" -MT ${OBJECTDIR}/peripherals/TWI/TWI_host.o -o ${OBJECTDIR}/peripherals/TWI/TWI_host.o peripherals/TWI/TWI_host.c 
	
${OBJECTDIR}/advanced_IO.o: advanced_IO.c  .generated_files/flags/free/bf16a5885a19d26222cce488faf665266dd6435e .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/advanced_IO.o.d 
	@${RM} ${OBJECTDIR}/advanced_IO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/advanced_IO.o.d" -MT "${OBJECTDIR}/advanced_IO.o.d" -MT ${OBJECTDIR}/advanced_IO.o -o ${OBJECTDIR}/advanced_IO.o advanced_IO.c 
	
${OBJECTDIR}/ECU_Main.o: ECU_Main.c  .generated_files/flags/free/bc2ae84640d9dfeef0b2a50b5742257c38bdbf0d .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ECU_Main.o.d 
	@${RM} ${OBJECTDIR}/ECU_Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/ECU_Main.o.d" -MT "${OBJECTDIR}/ECU_Main.o.d" -MT ${OBJECTDIR}/ECU_Main.o -o ${OBJECTDIR}/ECU_Main.o ECU_Main.c 
	
${OBJECTDIR}/buzzer.o: buzzer.c  .generated_files/flags/free/bb04bc67362d754b6ad8dcf3e9119abe8fbc6170 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/buzzer.o.d 
	@${RM} ${OBJECTDIR}/buzzer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/buzzer.o.d" -MT "${OBJECTDIR}/buzzer.o.d" -MT ${OBJECTDIR}/buzzer.o -o ${OBJECTDIR}/buzzer.o buzzer.c 
	
${OBJECTDIR}/leds.o: leds.c  .generated_files/flags/free/49104c95104f3820be4a8520918ea223adfa7b3a .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/leds.o.d 
	@${RM} ${OBJECTDIR}/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/leds.o.d" -MT "${OBJECTDIR}/leds.o.d" -MT ${OBJECTDIR}/leds.o -o ${OBJECTDIR}/leds.o leds.c 
	
${OBJECTDIR}/systemTime.o: systemTime.c  .generated_files/flags/free/3b7187b5ba3539113252ad92e9d4dfb550f67cde .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/systemTime.o.d 
	@${RM} ${OBJECTDIR}/systemTime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/systemTime.o.d" -MT "${OBJECTDIR}/systemTime.o.d" -MT ${OBJECTDIR}/systemTime.o -o ${OBJECTDIR}/systemTime.o systemTime.c 
	
else
${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o: peripherals/CLKCTRL/CLKCTRL.c  .generated_files/flags/free/b017c68bfb6a62e8f27564d9f5444d481d703400 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/CLKCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o -o ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o peripherals/CLKCTRL/CLKCTRL.c 
	
${OBJECTDIR}/peripherals/RTC/RTC.o: peripherals/RTC/RTC.c  .generated_files/flags/free/ac961790e06dcb7e2cd86ce30ab89478257a3241 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/RTC" 
	@${RM} ${OBJECTDIR}/peripherals/RTC/RTC.o.d 
	@${RM} ${OBJECTDIR}/peripherals/RTC/RTC.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/RTC/RTC.o.d" -MT "${OBJECTDIR}/peripherals/RTC/RTC.o.d" -MT ${OBJECTDIR}/peripherals/RTC/RTC.o -o ${OBJECTDIR}/peripherals/RTC/RTC.o peripherals/RTC/RTC.c 
	
${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o: peripherals/SLPCTRL/SLPCTRL.c  .generated_files/flags/free/cb218cbc58700bb41588d5769444ddc845e4b593 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/SLPCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o.d" -MT "${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o.d" -MT ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o -o ${OBJECTDIR}/peripherals/SLPCTRL/SLPCTRL.o peripherals/SLPCTRL/SLPCTRL.c 
	
${OBJECTDIR}/peripherals/TWI/TWI_host.o: peripherals/TWI/TWI_host.c  .generated_files/flags/free/21a687d886d8d5c66465a140e76e6ddf8c2387de .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/TWI" 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_host.o.d 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_host.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/TWI/TWI_host.o.d" -MT "${OBJECTDIR}/peripherals/TWI/TWI_host.o.d" -MT ${OBJECTDIR}/peripherals/TWI/TWI_host.o -o ${OBJECTDIR}/peripherals/TWI/TWI_host.o peripherals/TWI/TWI_host.c 
	
${OBJECTDIR}/advanced_IO.o: advanced_IO.c  .generated_files/flags/free/fe3e73e91c38d636e8a9ec754968fd178bee68ed .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/advanced_IO.o.d 
	@${RM} ${OBJECTDIR}/advanced_IO.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/advanced_IO.o.d" -MT "${OBJECTDIR}/advanced_IO.o.d" -MT ${OBJECTDIR}/advanced_IO.o -o ${OBJECTDIR}/advanced_IO.o advanced_IO.c 
	
${OBJECTDIR}/ECU_Main.o: ECU_Main.c  .generated_files/flags/free/926e45a00051f1a9734c6f264b0f83cfd850ef46 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/ECU_Main.o.d 
	@${RM} ${OBJECTDIR}/ECU_Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/ECU_Main.o.d" -MT "${OBJECTDIR}/ECU_Main.o.d" -MT ${OBJECTDIR}/ECU_Main.o -o ${OBJECTDIR}/ECU_Main.o ECU_Main.c 
	
${OBJECTDIR}/buzzer.o: buzzer.c  .generated_files/flags/free/259105411f0eb8019d1c2e03fdbbf63c2e3e554e .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/buzzer.o.d 
	@${RM} ${OBJECTDIR}/buzzer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/buzzer.o.d" -MT "${OBJECTDIR}/buzzer.o.d" -MT ${OBJECTDIR}/buzzer.o -o ${OBJECTDIR}/buzzer.o buzzer.c 
	
${OBJECTDIR}/leds.o: leds.c  .generated_files/flags/free/1bbcc93e932524a67340e2c46752af8ef5ae7e58 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/leds.o.d 
	@${RM} ${OBJECTDIR}/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/leds.o.d" -MT "${OBJECTDIR}/leds.o.d" -MT ${OBJECTDIR}/leds.o -o ${OBJECTDIR}/leds.o leds.c 
	
${OBJECTDIR}/systemTime.o: systemTime.c  .generated_files/flags/free/693910a7c124176e06abc42d1f33d6628ac09cde .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/systemTime.o.d 
	@${RM} ${OBJECTDIR}/systemTime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/systemTime.o.d" -MT "${OBJECTDIR}/systemTime.o.d" -MT ${OBJECTDIR}/systemTime.o -o ${OBJECTDIR}/systemTime.o systemTime.c 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_free=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1     -gdwarf-2 -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.map  -DXPRJ_free=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/ECUFirmware.X.${IMAGE_TYPE}.hex"
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
