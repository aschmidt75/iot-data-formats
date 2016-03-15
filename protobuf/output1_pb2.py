
import testschema_pb2

ddu = testschema_pb2.DeviceDataUpdate()

d1 = ddu.definition.add()
d1.id = "tempc"
d1.category = "Temperature"
d1.unit = "celsius"

e = ddu.entry.add()
e.defId = "tempc"
e.value = "17.1"
e.ts = "1457696012"


e = ddu.entry.add()
e.defId = "tempc"
e.value = "18.3"
e.ts = "1457696022"


e = ddu.entry.add()
e.defId = "tempc"
e.value = "14.1"
e.ts = "1457696032"


e = ddu.entry.add()
e.defId = "tempc"
e.value = "12.9"
e.ts = "1457696042"


e = ddu.entry.add()
e.defId = "tempc"
e.value = "10.6"
e.ts = "1457696052"

#print ddu

# Write the new address book back to disk.
f = open("test1.pb2", "wb")
f.write(ddu.SerializeToString())
f.close()
