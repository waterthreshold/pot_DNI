include ../config.mk
include ../config.in

#INCLUDE 
CFLAGS	+= -I. -Ii$(ACOSTOPDIR)/nvram -I$(ACOSTOPDIR)/shared -I$(ACOSTOPDIR)/include -Wall
CFLAGS	+= -s -O2
CFLAGS  += -s -O2
CFLAGS  += -I$(SRCBASE)/include

#LIBRARY
LDFLAGS	+= -L$(ROUTERDIR)/nvram -L$(INSTALLDIR)/nvram/usr/lib -lnvram
LDFLAGS	+= -L$(ACOSTOPDIR)/shared -L$(TARGETDIR)/usr/lib -lacos_shared -L$(ACOSTOPDIR)/acos_nat_cli -lnat
ifeq ($(CONFIG_KERNEL_2_6_36),y)
LDFLAGS	+= -lgcc_s
endif

VPATH =src
vpath *.c *.h

TARGET = potd
OBJS = pot.o
OBJS += excmd.o

$(TARGET): $(OBJS)
	$(CC) -o $@ $^ $(LDFLAGS)

$(OBJS): %.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@ 

clean:
	for i in $(OBJS); do rm -f $$i; done
	for i in $(OBJS:%.o=.%.depend); do rm -f $$i; done
	rm -f $(TARGET)
	#rm potval ntpst stmac					
install: $(TARGET)
	$(STRIP) $(TARGET)
	install -d $(TARGETDIR)/sbin
	install -m 755 $(TARGET) $(TARGETDIR)/sbin
	cd $(TARGETDIR)/sbin && ln -sf $(TARGET) potval
	cd $(TARGETDIR)/sbin && ln -sf $(TARGET) ntpst
	cd $(TARGETDIR)/sbin && ln -sf  $(TARGET) stmac
