set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(MCU_LINKER_SCRIPT STM32F407VETx_FLASH.ld)
set(MCU_ARCH cortex-m4)
set(MCU_FLOAT_ABI soft)
set(MCU_FPU fpv4-sp-d16)

set(TOOLCHAIN_PREFIX "/usr")
set(TARGET_TRIPLET arm-none-eabi)
set(TOOLCHAIN_BIN_DIR "${TOOLCHAIN_PREFIX}/bin")
set(TOOLCHAIN_INC_DIR "${TOOLCHAIN_PREFIX}/${TARGET_TRIPLET}/include")
set(TOOLCHAIN_LIB_DIR "${TOOLCHAIN_PREFIX}/${TARGET_TRIPLET}/lib")

set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_C_COMPILER "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-gcc")
set(CMAKE_CXX_COMPILER "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-g++")
set(CMAKE_ASM_COMPILER "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-gcc")
set(CMAKE_OBJCOPY
    "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-objcopy"
    CACHE INTERNAL "objcopy tool")
set(CMAKE_OBJDUMP
    "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-objdump"
    CACHE INTERNAL "objdump tool")
set(CMAKE_SIZE
    "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-size"
    CACHE INTERNAL "size tool")
set(CMAKE_DEBUGER
    "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-gdb"
    CACHE INTERNAL "debuger")
set(CMAKE_CPPFILT
    "${TOOLCHAIN_BIN_DIR}/${TARGET_TRIPLET}-c++filt"
    CACHE INTERNAL "C++filt")

set(CMAKE_C_FLAGS_DEBUG
    "-Og -g"
    CACHE INTERNAL "c compiler flags debug")
set(CMAKE_CXX_FLAGS_DEBUG
    "-Og -g"
    CACHE INTERNAL "cxx compiler flags debug")
set(CMAKE_ASM_FLAGS_DEBUG
    "-g"
    CACHE INTERNAL "asm compiler flags debug")
set(CMAKE_EXE_LINKER_FLAGS_DEBUG
    "-Xlinker -Map=output.map --specs=rdimon.specs -lc -lrdimon"
    CACHE INTERNAL "linker flags debug")

set(CMAKE_C_FLAGS_RELEASE
    "-Os -flto"
    CACHE INTERNAL "c compiler flags release")
set(CMAKE_CXX_FLAGS_RELEASE
    "-Os -flto"
    CACHE INTERNAL "cxx compiler flags release")
set(CMAKE_ASM_FLAGS_RELEASE
    ""
    CACHE INTERNAL "asm compiler flags release")
set(CMAKE_EXE_LINKER_FLAGS_RELEASE
    "-Xlinker -Map=output.map -s -flto"
    CACHE INTERNAL "linker flags release")

set(CMAKE_FIND_ROOT_PATH "${TOOLCHAIN_PREFIX}/${TARGET_TRIPLET}"
                         ${EXTRA_FIND_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_C_FLAGS
    "-mthumb -fno-builtin -mcpu=cortex-m4 -Wall -std=gnu99 -ffunction-sections -fdata-sections -fomit-frame-pointer -mabi=aapcs -fno-unroll-loops -ffast-math -ftree-vectorize"
    CACHE INTERNAL "c compiler flags")
set(CMAKE_CXX_FLAGS
    "-mthumb -fno-builtin -mcpu=cortex-m4 -Wall -std=c++11 -ffunction-sections -fdata-sections -fomit-frame-pointer -mabi=aapcs -fno-unroll-loops -ffast-math -ftree-vectorize"
    CACHE INTERNAL "cxx compiler flags")
set(CMAKE_ASM_FLAGS
    "-mthumb -mcpu=cortex-m4 -x assembler-with-cpp"
    CACHE INTERNAL "asm compiler flags")
set(CMAKE_EXE_LINKER_FLAGS
    "-Wl,--gc-sections -mthumb -mcpu=cortex-m4 -mabi=aapcs"
    CACHE INTERNAL "executable linker flags")
set(CMAKE_MODULE_LINKER_FLAGS
    "-mthumb -mcpu=cortex-m4 -mabi=aapcs"
    CACHE INTERNAL "module linker flags")
set(CMAKE_SHARED_LINKER_FLAGS
    "-mthumb -mcpu=cortex-m4 -mabi=aapcs"
    CACHE INTERNAL "shared linker flags")

set(CMAKE_EXE_LINKER_FLAGS
    "${CMAKE_EXE_LINKER_FLAGS} -T ${CMAKE_SOURCE_DIR}/toolchain/${MCU_LINKER_SCRIPT}"
)
