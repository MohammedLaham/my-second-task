import 'package:flutter/material.dart';
import 'package:second_task/screens/home_screen.dart';

class AnimationItem extends StatefulWidget {
  const AnimationItem({Key? key}) : super(key: key);

  @override
  State<AnimationItem> createState() => _AnimationItemState();
}

class _AnimationItemState extends State<AnimationItem> {
  final _items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItem() {
    _items.insert(0, 'Item${_items.length + 1}');
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
        index,
        (_, animation) => SizeTransition(
              sizeFactor: animation,
              child: const Card(
                margin: EdgeInsets.all(10),
                color: Colors.red,
                child: ListTile(
                  title: Text(
                    'Deleted',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
        duration: const Duration(milliseconds: 400));
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
                 navTo(context, const SignUpPage());
              },),
              centerTitle: true,
              backgroundColor: Colors.black87,
              title: const Text(
                'Flutter Mapp',
              )),
          body: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white, size: 35),
                onPressed: () {
                  _addItem();
                },
              ),
              Expanded(
                child: AnimatedList(
                  key: _key,
                  initialItemCount: 0,
                  padding: const EdgeInsets.all(10),
                  itemBuilder: (context, index, animation) {
                    return SizeTransition(
                      key: UniqueKey(),
                      sizeFactor: animation,
                      child: Card(
                        margin: EdgeInsets.all(10),
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                            _items[index],
                            style: TextStyle(fontSize: 24),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _removeItem(index);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          )),
    );

  }
  navTo(context, Widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}
