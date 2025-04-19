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
FINAL_IMAGE=${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=peripherals/CLKCTRL/CLKCTRL.c peripherals/TWI/TWI_client.c Motor_Main.c ../../ECUFirmware/ECUFirmware.X/buzzer.c ../../ECUFirmware/ECUFirmware.X/leds.c ../../ECUFirmware/ECUFirmware.X/systemTime.c TWI_blockData.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o ${OBJECTDIR}/peripherals/TWI/TWI_client.o ${OBJECTDIR}/Motor_Main.o ${OBJECTDIR}/_ext/2104088289/buzzer.o ${OBJECTDIR}/_ext/2104088289/leds.o ${OBJECTDIR}/_ext/2104088289/systemTime.o ${OBJECTDIR}/TWI_blockData.o
POSSIBLE_DEPFILES=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d ${OBJECTDIR}/peripherals/TWI/TWI_client.o.d ${OBJECTDIR}/Motor_Main.o.d ${OBJECTDIR}/_ext/2104088289/buzzer.o.d ${OBJECTDIR}/_ext/2104088289/leds.o.d ${OBJECTDIR}/_ext/2104088289/systemTime.o.d ${OBJECTDIR}/TWI_blockData.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o ${OBJECTDIR}/peripherals/TWI/TWI_client.o ${OBJECTDIR}/Motor_Main.o ${OBJECTDIR}/_ext/2104088289/buzzer.o ${OBJECTDIR}/_ext/2104088289/leds.o ${OBJECTDIR}/_ext/2104088289/systemTime.o ${OBJECTDIR}/TWI_blockData.o

# Source Files
SOURCEFILES=peripherals/CLKCTRL/CLKCTRL.c peripherals/TWI/TWI_client.c Motor_Main.c ../../ECUFirmware/ECUFirmware.X/buzzer.c ../../ECUFirmware/ECUFirmware.X/leds.c ../../ECUFirmware/ECUFirmware.X/systemTime.c TWI_blockData.c



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
	${MAKE}  -f nbproject/Makefile-free.mk ${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=AVR128DB48
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o: peripherals/CLKCTRL/CLKCTRL.c  .generated_files/flags/free/3854a3c4381346535231a3735531a6fb2bd45916 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/CLKCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o -o ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o peripherals/CLKCTRL/CLKCTRL.c 
	
${OBJECTDIR}/peripherals/TWI/TWI_client.o: peripherals/TWI/TWI_client.c  .generated_files/flags/free/4ea276deed83c167f35f285394b522dcf3146d33 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/TWI" 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o.d 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT ${OBJECTDIR}/peripherals/TWI/TWI_client.o -o ${OBJECTDIR}/peripherals/TWI/TWI_client.o peripherals/TWI/TWI_client.c 
	
${OBJECTDIR}/Motor_Main.o: Motor_Main.c  .generated_files/flags/free/58434ddd7d698bf1b6898cdb6e8e8980d2555021 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motor_Main.o.d 
	@${RM} ${OBJECTDIR}/Motor_Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/Motor_Main.o.d" -MT "${OBJECTDIR}/Motor_Main.o.d" -MT ${OBJECTDIR}/Motor_Main.o -o ${OBJECTDIR}/Motor_Main.o Motor_Main.c 
	
${OBJECTDIR}/_ext/2104088289/buzzer.o: ../../ECUFirmware/ECUFirmware.X/buzzer.c  .generated_files/flags/free/bb04bc67362d754b6ad8dcf3e9119abe8fbc6170 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2104088289" 
	@${RM} ${OBJECTDIR}/_ext/2104088289/buzzer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2104088289/buzzer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/2104088289/buzzer.o.d" -MT "${OBJECTDIR}/_ext/2104088289/buzzer.o.d" -MT ${OBJECTDIR}/_ext/2104088289/buzzer.o -o ${OBJECTDIR}/_ext/2104088289/buzzer.o ../../ECUFirmware/ECUFirmware.X/buzzer.c 
	
${OBJECTDIR}/_ext/2104088289/leds.o: ../../ECUFirmware/ECUFirmware.X/leds.c  .generated_files/flags/free/49104c95104f3820be4a8520918ea223adfa7b3a .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2104088289" 
	@${RM} ${OBJECTDIR}/_ext/2104088289/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/2104088289/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/2104088289/leds.o.d" -MT "${OBJECTDIR}/_ext/2104088289/leds.o.d" -MT ${OBJECTDIR}/_ext/2104088289/leds.o -o ${OBJECTDIR}/_ext/2104088289/leds.o ../../ECUFirmware/ECUFirmware.X/leds.c 
	
${OBJECTDIR}/_ext/2104088289/systemTime.o: ../../ECUFirmware/ECUFirmware.X/systemTime.c  .generated_files/flags/free/3b7187b5ba3539113252ad92e9d4dfb550f67cde .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2104088289" 
	@${RM} ${OBJECTDIR}/_ext/2104088289/systemTime.o.d 
	@${RM} ${OBJECTDIR}/_ext/2104088289/systemTime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/2104088289/systemTime.o.d" -MT "${OBJECTDIR}/_ext/2104088289/systemTime.o.d" -MT ${OBJECTDIR}/_ext/2104088289/systemTime.o -o ${OBJECTDIR}/_ext/2104088289/systemTime.o ../../ECUFirmware/ECUFirmware.X/systemTime.c 
	
${OBJECTDIR}/TWI_blockData.o: TWI_blockData.c  .generated_files/flags/free/743029a16e3a8bc49d104c2602f0f2a71d46497c .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/TWI_blockData.o.d 
	@${RM} ${OBJECTDIR}/TWI_blockData.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1 -g -DDEBUG  -gdwarf-2  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/TWI_blockData.o.d" -MT "${OBJECTDIR}/TWI_blockData.o.d" -MT ${OBJECTDIR}/TWI_blockData.o -o ${OBJECTDIR}/TWI_blockData.o TWI_blockData.c 
	
else
${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o: peripherals/CLKCTRL/CLKCTRL.c  .generated_files/flags/free/4eb69bf65c3243c79c7f3e12c5ceae72c7a6ca63 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/CLKCTRL" 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d 
	@${RM} ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT "${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o.d" -MT ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o -o ${OBJECTDIR}/peripherals/CLKCTRL/CLKCTRL.o peripherals/CLKCTRL/CLKCTRL.c 
	
${OBJECTDIR}/peripherals/TWI/TWI_client.o: peripherals/TWI/TWI_client.c  .generated_files/flags/free/6e8d7a76c24748a6f8b7d89d39b01dfa7d6ac20 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/peripherals/TWI" 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o.d 
	@${RM} ${OBJECTDIR}/peripherals/TWI/TWI_client.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT "${OBJECTDIR}/peripherals/TWI/TWI_client.o.d" -MT ${OBJECTDIR}/peripherals/TWI/TWI_client.o -o ${OBJECTDIR}/peripherals/TWI/TWI_client.o peripherals/TWI/TWI_client.c 
	
${OBJECTDIR}/Motor_Main.o: Motor_Main.c  .generated_files/flags/free/7e0340d06ddf62b59d512e24a324684fb17ba674 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Motor_Main.o.d 
	@${RM} ${OBJECTDIR}/Motor_Main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/Motor_Main.o.d" -MT "${OBJECTDIR}/Motor_Main.o.d" -MT ${OBJECTDIR}/Motor_Main.o -o ${OBJECTDIR}/Motor_Main.o Motor_Main.c 
	
${OBJECTDIR}/_ext/2104088289/buzzer.o: ../../ECUFirmware/ECUFirmware.X/buzzer.c  .generated_files/flags/free/259105411f0eb8019d1c2e03fdbbf63c2e3e554e .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2104088289" 
	@${RM} ${OBJECTDIR}/_ext/2104088289/buzzer.o.d 
	@${RM} ${OBJECTDIR}/_ext/2104088289/buzzer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/2104088289/buzzer.o.d" -MT "${OBJECTDIR}/_ext/2104088289/buzzer.o.d" -MT ${OBJECTDIR}/_ext/2104088289/buzzer.o -o ${OBJECTDIR}/_ext/2104088289/buzzer.o ../../ECUFirmware/ECUFirmware.X/buzzer.c 
	
${OBJECTDIR}/_ext/2104088289/leds.o: ../../ECUFirmware/ECUFirmware.X/leds.c  .generated_files/flags/free/1bbcc93e932524a67340e2c46752af8ef5ae7e58 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2104088289" 
	@${RM} ${OBJECTDIR}/_ext/2104088289/leds.o.d 
	@${RM} ${OBJECTDIR}/_ext/2104088289/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/2104088289/leds.o.d" -MT "${OBJECTDIR}/_ext/2104088289/leds.o.d" -MT ${OBJECTDIR}/_ext/2104088289/leds.o -o ${OBJECTDIR}/_ext/2104088289/leds.o ../../ECUFirmware/ECUFirmware.X/leds.c 
	
${OBJECTDIR}/_ext/2104088289/systemTime.o: ../../ECUFirmware/ECUFirmware.X/systemTime.c  .generated_files/flags/free/693910a7c124176e06abc42d1f33d6628ac09cde .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
	@${MKDIR} "${OBJECTDIR}/_ext/2104088289" 
	@${RM} ${OBJECTDIR}/_ext/2104088289/systemTime.o.d 
	@${RM} ${OBJECTDIR}/_ext/2104088289/systemTime.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -x c -D__$(MP_PROCESSOR_OPTION)__    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -DXPRJ_free=$(CND_CONF)  $(COMPARISON_BUILD)  -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     -MD -MP -MF "${OBJECTDIR}/_ext/2104088289/systemTime.o.d" -MT "${OBJECTDIR}/_ext/2104088289/systemTime.o.d" -MT ${OBJECTDIR}/_ext/2104088289/systemTime.o -o ${OBJECTDIR}/_ext/2104088289/systemTime.o ../../ECUFirmware/ECUFirmware.X/systemTime.c 
	
${OBJECTDIR}/TWI_blockData.o: TWI_blockData.c  .generated_files/flags/free/620e4c05aae2162a0288662d44cad63a174e9511 .generated_files/flags/free/da39a3ee5e6b4b0d3255bfef95601890afd80709
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
${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -DXPRJ_free=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1     -gdwarf-2 -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group  -Wl,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1
	@${RM} ${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.hex 
	
	
else
${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.map  -DXPRJ_free=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1    -Wl,--gc-sections -O0 -ffunction-sections -fdata-sections -fshort-enums -funsigned-char -funsigned-bitfields -mext=cci -Wall -gdwarf-3 -mconst-data-in-progmem -mconst-data-in-config-mapped-progmem     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -o ${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -Wl,--start-group  -Wl,-lm -Wl,--end-group 
	${MP_CC_DIR}\\avr-objcopy -O ihex "${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}" "${DISTDIR}/MotorFirmware.X.${IMAGE_TYPE}.hex"
	
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
