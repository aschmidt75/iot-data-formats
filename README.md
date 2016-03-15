# Space comparison of IoT data formats

Supplementary material

## Start VM

The easiest way to run all examples is to use the Vagrant definition and
start a virtual machine:

```bash
~$ vagrant up
~$ vagrant ssh
```

Examples run on a Ubuntu 14.04, with the following packages installed:
* python-demjson jq python-protobuf protobuf-compiler build-essential ruby-dev openjdk-7-jdk
* GEMs: cbor cbor-diag cddl msgpack
* installed libcbor from `https://github.com/PJK/libcbor/releases/download/v0.4.0/libcbor-0.4.0-Linux.deb`

## Running examples

Source data files can be found in `data/`. Two cases are modeled, `test1`
contains temperature values and the definition for a temperature entry. `test2`
also contains Humidity values.

### EXI

For running the EXI compression examples, `libexificient` has to be installed.
A supplied `install.sh` does that. A `run_gui.sh` starts a Java-based UI.

```bash
~$ cd /vagrant/exi
~$ ./install.sh
(...)
~$ ./run_gui.sh
```

### BSON

Conversion scripts print out originial file size, followed by compressed
file size (in this case, BSON)

```bash
~$ cd /vagrant/bson
~$ ./json_to_bson.rb ../data/test1.json test1.bson
496
418
~$ ./json_to_bson.rb ../data/test2.json test2.bson
891
757

~$ hd test1.bson
00000000  a2 01 00 00 03 64 65 76  69 63 65 2d 64 61 74 61  |.....device-data|
00000010  2d 75 70 64 61 74 65 00  89 01 00 00 03 64 65 66  |-update......def|
00000020  69 6e 69 74 69 6f 6e 73  00 3d 00 00 00 03 74 65  |initions.=....te|
00000030  6d 70 63 00 31 00 00 00  02 63 61 74 65 67 6f 72  |mpc.1....categor|
(...)
```

### CBOR

See also [http://cbor.io](http://cbor.i)

Conversion scripts print out originial file size, followed by compressed
file size (in this case, CBOR)

```bash
~$ ./json_to_cbor.rb ../data/test1.json ./test1.cbor
496
274
~$ ./json_to_cbor.rb ../data/test2.json ./test2.cbor
891
488
~$ hd ./test1.cbor
00000000  a1 72 64 65 76 69 63 65  2d 64 61 74 61 2d 75 70  |.rdevice-data-up|
00000010  64 61 74 65 a2 6b 64 65  66 69 6e 69 74 69 6f 6e  |date.kdefinition|
00000020  73 a1 65 74 65 6d 70 63  a2 68 63 61 74 65 67 6f  |s.etempc.hcatego|
00000030  72 79 6b 54 65 6d 70 65  72 61 74 75 72 65 64 75  |rykTemperaturedu|
00000040  6e 69 74 67 63 65 6c 73  69 75 73 67 65 6e 74 72  |nitgcelsiusgentr|
(...)
```

### Messagepack

See [http://msgpack.org/](http://msgpack.org/)

Works comparable to CBOR above.


### Protobuf

For protobuf, `testschema.proto` needs to be compiled using `protoc`:

```bash
~$ cd /vagrant/protobuf
~$ protoc -I. --python_out=. testschema.proto
```

Afterwards, to python scripts generate output (instead of converting input files):

```bash
~$ python output1_pb2.py
~$ python output2_pb2.py
~$ ls -al *.pb2
-rw-rw-r-- 1 c018 c018 166 Mär 15 16:06 test1.pb2
-rw-rw-r-- 1 c018 c018 315 Mär 15 16:06 test2.pb2
~$ hd test1.pb2
00000000  0a 1d 0a 05 74 65 6d 70  63 12 0b 54 65 6d 70 65  |....tempc..Tempe|
00000010  72 61 74 75 72 65 1a 07  63 65 6c 73 69 75 73 12  |rature..celsius.|
00000020  19 0a 05 74 65 6d 70 63  12 04 31 37 2e 31 1a 0a  |...tempc..17.1..|
00000030  31 34 35 37 36 39 36 30  31 32 12 19 0a 05 74 65  |1457696012....te|
(...)
```
