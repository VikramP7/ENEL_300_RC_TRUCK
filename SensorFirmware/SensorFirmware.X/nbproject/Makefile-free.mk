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
FINAL_IMAGE=${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=peripherals/CLKCTRL/CLKCTRL.c peripherals/TWI/TWI_client.c Sensor_Main.c TWI_blockData.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o ${OBJECTDIR}/peripherals/TWI/TWI_client.o ${OBJECTDIR}/Sensor_Main.o ${OBJECTDIR}/TWI_blockData.o
POSSIBLE_DEPFILES=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d ${OBJECTDIR}/peripherals/TWI/TWI_client.o.d ${OBJECTDIR}/Sensor_Main.o.d ${OBJECTDIR}/TWI_blockData.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o ${OBJECTDIR}/peripherals/TWI/TWI_client.o ${OBJECTDIR}/Sensor_Main.o ${OBJECTDIR}/TWI_blockData.o

# Source Files
SOURCEFILES=peripherals/CLKCTRL/CLKCTRL.c peripherals/TWI/TWI_client.c Sensor_Main.c TWI_blockData.c



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
	${MAKE}  -f nbproject/Makefile-free.mk ${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=AVR128DB48
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o: peripherals/CLKCTRL/CLKCTRL.c  .generated_files/flags/free/c9a8c3002c42cbdeaf20e51b05eb36746060cbe6 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/CLKCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o -o ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o peripherals/CLKCTRL/CLKCTRL.c 
	
${OBJECTDIR}/peripherals/TWI/TWI_client.o: peripherals/TWI/TWI_client.c  .generated_files/flags/free/c540f245803ba25077d52ff32de228da0bc8ba07 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/TWI" 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o.d 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT ${OBJECTDIR}/peripherals/TWI/TWI_client.o -o ${OBJECTDIR}/peripherals/TWI/TWI_client.o peripherals/TWI/TWI_client.c 
	
${OBJECTDIR}/Sensor_Main.o: Sensor_Main.c  .generated_files/flags/free/e1b99a479ee303fc5cd407818f0c4729c4f921ec .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Sensor_Main.o.d 
	@${RM} ${OBJECTDIR}/Sensor_Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/Sensor_Main.o.d" -MT "${OBJECTDIR}/Sensor_Main.o.d" -MT ${OBJECTDIR}/Sensor_Main.o -o ${OBJECTDIR}/Sensor_Main.o Sensor_Main.c 
	
${OBJECTDIR}/TWI_blockData.o: TWI_blockData.c  .generated_files/flags/free/7c4f7f907745e35356c84aa0fd5958b070207f6f .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TWI_blockData.o.d 
	@${RM} ${OBJECTDIR}/TWI_blockData.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/TWI_blockData.o.d" -MT "${OBJECTDIR}/TWI_blockData.o.d" -MT ${OBJECTDIR}/TWI_blockData.o -o ${OBJECTDIR}/TWI_blockData.o TWI_blockData.c 
	
else
${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o: peripherals/CLKCTRL/CLKCTRL.c  .generated_files/flags/free/a8a09ea8c4885598c03a8ad15169ab84a6fdf227 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/CLKCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o -o ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o peripherals/CLKCTRL/CLKCTRL.c 
	
${OBJECTDIR}/peripherals/TWI/TWI_client.o: peripherals/TWI/TWI_client.c  .generated_files/flags/free/4a393aad98c3338f5814109ed01567d56da8f410 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/TWI" 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o.d 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT ${OBJECTDIR}/peripherals/TWI/TWI_client.o -o ${OBJECTDIR}/peripherals/TWI/TWI_client.o peripherals/TWI/TWI_client.c 
	
${OBJECTDIR}/Sensor_Main.o: Sensor_Main.c  .generated_files/flags/free/e77f78d49d764a3e19b16ad89a1220ba314f8485 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Sensor_Main.o.d 
	@${RM} ${OBJECTDIR}/Sensor_Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/Sensor_Main.o.d" -MT "${OBJECTDIR}/Sensor_Main.o.d" -MT ${OBJECTDIR}/Sensor_Main.o -o ${OBJECTDIR}/Sensor_Main.o Sensor_Main.c 
	
${OBJECTDIR}/TWI_blockData.o: TWI_blockData.c  .generated_files/flags/free/58fde98d47c097afa397735e967963a636d6a475 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TWI_blockData.o.d 
	@${RM} ${OBJECTDIR}/TWI_blockData.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/TWI_blockData.o.d" -MT "${OBJECTDIR}/TWI_blockData.o.d" -MT ${OBJECTDIR}/TWI_blockData.o -o ${OBJECTDIR}/TWI_blockData.o TWI_blockData.c 
	
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
${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_free=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1     -gdwarf-2 -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.map  -DXPRJ_free=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/SensorFirmware.X.${IMAGE_TYPE}.hex"
	
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
