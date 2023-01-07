
import 'package:hive_flutter/adapters.dart';

import 'model/zikr.dart';

class ZikrHiveAdapter extends TypeAdapter<Zikr> {
  @override
  final typeId = 0;

  @override
  Zikr read(BinaryReader reader) {
    final int counter = reader.readInt();
    final String title = reader.readString();
    final DateTime dateTime = reader.read();

    return Zikr(
      counter: counter,
      title: title,
      dateTime: dateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Zikr obj) {
    writer.writeInt(obj.counter);
    writer.writeString(obj.title);
    writer.write(obj.dateTime);
  }
}