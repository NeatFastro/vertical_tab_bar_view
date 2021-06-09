# vertical_tab_bar_view

Flutter's Material TabView but scrolls vertically and without snapping.

## Getting Started

The most simple to use pacage ever just replace your **TabBarView** widget's name with **VerticalTabBarView** and you're done

\*Note: The example app contains example how to dynamically create **Tabs** & **(Vertical)TabBarView**

![example](https://github.com/NeatFastro/vertical_tab_bar_view/blob/main/assets/example.gif)

```
import 'package:flutter/material.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

void main() {
  runApp(TabBarDemo());
}

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body:    //  TabBarView(  <--- replace with **VerticalTabBarView**
            Column(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
```

