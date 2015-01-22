JAVA_VERSION?=6

JHOME:=$(shell /usr/libexec/java_home -v 1.$(JAVA_VERSION))
SYSTEM:=$(shell uname -s)

CPPFLAGS += -DJAVA_VERSION=$(JAVA_VERSION)
CXXFLAGS += -g
ifeq ($(JAVA_VERSION),7)
VM_DIR=$(JHOME)/jre/lib
LDFLAGS += -L$(VM_DIR)/server -Wl,-rpath,$(VM_DIR) -Wl,-rpath,$(VM_DIR)/server
CXXFLAGS += -I$(JHOME)/include -I$(JHOME)/include/$(SYSTEM)
LDLIBS += -ljvm
else
CXXFLAGS += -framework JavaVM
endif

CXXFLAGS += -framework CoreFoundation

all: launch launch.class

launch.class: launch.java
	/usr/libexec/java_home -v 1.$(JAVA_VERSION) --exec javac launch.java

clean:
	rm -rf launch *.class *.dSYM
