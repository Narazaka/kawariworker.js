TARGET_JS = kawariworker.js
SHIORI_NAME = kawari
SHIORI_WORKER_CLASS = KawariWorkerClient
SHIORI_CLASS = Kawari

SHIORI = node_modules/kawari.js/kawari-828/build/mach/em/kawari.js
NATIVESHIORI = node_modules/nativeshiori/nativeshiori.js
ENCODING = node_modules/encoding-japanese/encoding.min.js
WORKERSERVER = node_modules/WorkerClientServer/WorkerServer.js
NATIVESHIORIWORKERSERVER = node_modules/NativeShioriWorker/NativeShioriWorkerServer.js

all: $(TARGET_JS)

$(TARGET_JS): client.coffee server.coffee $(SHIORI) $(NATIVESHIORI) $(ENCODING) $(WORKERSERVER) $(NATIVESHIORIWORKERSERVER)
	coffee make_worker_script_auto.coffee $^ $(SHIORI_NAME) $(SHIORI_WORKER_CLASS) $(SHIORI_CLASS) > $@

clean:
	rm *.js *.map

