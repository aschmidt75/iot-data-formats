
import testschema_pb2

ddu = testschema_pb2.DeviceDataUpdate()

d1 = ddu.definition.add()
d1.id = "tempc"
d1.category = "Temperature"
d1.unit = "celsius"

d1 = ddu.definition.add()
d1.id = "hum"
d1.category = "RelativeHumidity"
d1.unit = "percent"

def add_entry(obj, def_id,value,timestamp):
    e = obj.entry.add()
    e.defId = def_id
    e.value = value
    e.ts = timestamp

add_entry(ddu,  "tempc",    "17.1",     "1457696012")
add_entry(ddu,  "hum",      "66",       "1457696012")
add_entry(ddu,  "tempc",    "18.3",     "1457696012")
add_entry(ddu,  "hum",      "62",       "1457696012")
add_entry(ddu,  "tempc",    "14.1",     "1457696012")
add_entry(ddu,  "hum",      "63",       "1457696012")
add_entry(ddu,  "tempc",    "12.9",     "1457696012")
add_entry(ddu,  "hum",      "66",       "1457696012")
add_entry(ddu,  "tempc",    "10.6",     "1457696012")
add_entry(ddu,  "hum",      "68",       "1457696012")

#print ddu

# Write the new address book back to disk.
f = open("test2.pb2", "wb")
f.write(ddu.SerializeToString())
f.close()
