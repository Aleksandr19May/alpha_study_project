import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {
  const Counter({
    Key? key,
  }) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  int counter = 0;
  final String keyCount = 'counter';

  Future<void> dataBase() async {
    final SharedPreferences _prefs = await prefs;
    if (_prefs.getInt(keyCount) == null) {
      _prefs.setInt(keyCount, 0);
    } else {
      counter = _prefs.getInt(keyCount)!;
    }
    setState(() {});
  }

  @override
  void initState() {
    dataBase();
    super.initState();
  }

  void saveData() async {
    final SharedPreferences _prefs = await prefs;
    _prefs.setInt(keyCount, counter);
    setState(() {});
  }

  void increment() async {
    counter++;
    saveData();
  }

  void decrement() {
    if (counter > 0) {
      counter--;
    }
    saveData();
  }

  void makeZero() {
    if (counter > 0) {
      counter = 0;
      saveData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 370,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 86, 137, 255),
            child: InkWell(
              child: Container(
                height: 40,
                width: 40,
                child: IconButton(
                    onPressed: () => decrement(),
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          IgnorePointer (
            ignoring: false,
            child: Material(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 57, 92, 220),
              child: InkWell(
                onTap: () => increment(),
                child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(counter.toString(),
                            style: const TextStyle(
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const Text(
                          'Dhikr',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              ),
            ),
          ),
          Material(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 86, 137, 255),
              child: InkWell(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: IconButton(
                      onPressed: () => makeZero(),
                      icon: const Icon(
                        Icons.replay,
                        color: Colors.white,
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
