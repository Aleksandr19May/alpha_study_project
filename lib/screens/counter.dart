
import 'package:alpha_study_project/screens/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter extends StatelessWidget {
  // final int counter;
  // final Function increment;
  // final Function decrement;
  // final Function zeroing;

  const Counter({
    // required this.counter,
    // required this.increment,
    // required this.decrement,
    // required this.zeroing,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.read<ProviderZikr>();
    
    return Container(
      height: 202,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(255, 2, 75, 202),
            child: InkWell(
              onTap: () => provider.decrement(),
              child: const SizedBox(
                height: 35,
                width: 35,
                child: Center(
                  child: Text(
                    '\u2013',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          Material(
            color: const Color.fromARGB(255, 2, 75, 202),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: InkWell(
              onTap: () => provider.increment(),
              child: SizedBox(
                  height: 154,
                  width: 154,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 30,
                      ),
                      NewWidget(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Dhikr',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  )),
            ),
          ),
          Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: const Color.fromARGB(255, 2, 75, 202),
            child: InkWell(
              onTap: () => provider.zeroing(),
              child: const SizedBox(
                height: 35,
                width: 35,
                child: Icon(
                  Icons.exposure_zero,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final counter = context.select(((ProviderZikr value) {
      return value.counter;
    }));

    return Text(
      counter.toString(),
      style: const TextStyle(
          fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }
}

