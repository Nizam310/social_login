import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TableView extends StatefulWidget {
  const TableView({super.key});

  @override
  State<TableView> createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  List<Map<String, dynamic>> list = [
    {'name': 'Nisam', 'age': '22', 'job': 'Developer'},




    {'name': 'Athul', 'age': '25', 'job': 'Developer'},
    {'name': 'Fahis', 'age': '23', 'job': 'Developer'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children:  [
         const Text('  with expand'),
          Column(
            children: [
              const Divider(),
              SizedBox(
                height: 50,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Name',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text(
                        'Age',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Text(
                        'Job',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10),
              ),
              const Divider(),
              Column(
                children: list.map((e) => SizedBox(
                height: 50,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                       e['name'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: Text(
                      e['age'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const VerticalDivider(),
                    Expanded(
                      child: Text(
                       e['job'],
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ).paddingSymmetric(horizontal: 10),
              )).toList(),),
              const Divider()
            ],
          ),
          const  Text('with flexible'),
          Row(children: [
            Flexible(
              child: Container(
                height: 200,
                color: Colors.red,
                child: const Row(
                  children: [
                    Expanded(child: Text('4',textAlign: TextAlign.center,))
                  ],
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 200,
                color: Colors.orange,
                child: const Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Text('2',textAlign: TextAlign.center,))
                  ],
                ),
              ),
            ),
          ],
          )
        ],
      ),
    );
  }
}

