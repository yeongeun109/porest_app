import 'package:cloudnapp/screen/Zone1/setting_Zone.dart';
import 'package:cloudnapp/screen/leaf/connect_Leaf.dart';
import 'package:cloudnapp/screen/plant/Plant1/connect_Plant.dart';
import 'package:cloudnapp/screen/Plant/Plant1/Plant1.dart';
import 'package:cloudnapp/screen/Plant/Plant2.dart';
import 'package:cloudnapp/screen/Plant/Plant3.dart';
import 'package:cloudnapp/screen/setting/setting_Building.dart';
import 'package:cloudnapp/screen/setting/setting_Floor.dart';
import 'package:cloudnapp/screen/setting/setting_Leaf.dart';
import 'package:cloudnapp/screen/setting/setting_Plant.dart';
import 'package:cloudnapp/screen/Zone1/setting_addZone.dart';
import 'package:cloudnapp/screen/tree1/Tree1.dart';
import 'package:cloudnapp/screen/tree1/connect_Tree1.dart';
import 'package:cloudnapp/screen/tree1/setting_tree1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloudnapp/screen/testscreen.dart';

class DirectoryWidget extends StatelessWidget {
  final String directoryName;
  final VoidCallback onPressedNext;

  DirectoryWidget({
    @required this.directoryName,
    this.onPressedNext,
  });

  @override
  Widget build(BuildContext context) {
    /*titleWidget(){
      return Container(
        child: Text(directoryName),
      );
    }*/

    IconButton folderIcon = IconButton(
      icon: Icon(Icons.folder),
      onPressed: onPressedNext,
    );

    if (directoryName == '대륭포스트타워' || directoryName == 'Floor 11') {
      return Card(
        child: ListTile(
          leading: folderIcon,
          title: Container(
            child: InkWell(
              onTap: () {},
              child: Text(directoryName),
            ),
          ),
          trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.playlist_add),
                      onPressed: () {
                        if (directoryName == '대륭포스트타워')
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SettingBuilding(
                                        directoryName: directoryName,
                                      )));
                        else
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SettingFloor(
                                          directoryName: directoryName)));
                      }),
                ],
              )),
        ),
      );
    } else if (directoryName == 'Zone 1' || directoryName == 'Zone 2' || directoryName == 'Zone 3') {
      return Card(
        child: ListTile(
          leading: folderIcon,
          title: Container(
            child: InkWell(
              onTap: () {},
              child: Text(directoryName),
            ),
          ),
          trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.playlist_add),
                    onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingAddZone(
                                        directoryName: directoryName))),
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingZone(directoryName: directoryName))),
                  ),
                ],
              )),
        ),
      );
    } else if (directoryName == 'Plant 1' || directoryName == 'Plant 2' || directoryName == 'Plant 3') {
      return Card(
        child: ListTile(
          leading: folderIcon,
          title: Container(
            child: InkWell(
              onTap: () {
                if (directoryName == 'Plant 1')
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Plant1(directoryName: directoryName)));
                else if (directoryName == 'Plant 2')
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Plant2()));
                else
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Plant3()));
              },
              child: Text(directoryName),
            ),
          ),
          trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.playlist_add),
                    onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingPlant(
                                        directoryName: directoryName))),
                  ),
                  IconButton(
                    icon: Icon(Icons.wifi),
                    onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ConnectPlant(
                                        directoryName: directoryName))),
                  ),
                ],
              )),
        ),
      );
    }else if(directoryName == 'Tree 1'){
      return Card(
        child: ListTile(
          leading: folderIcon,
          title: Container(
            child: InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Tree1(directoryName: directoryName))),
              child: Text(directoryName),
            ),
          ),
          trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                SettingTree1(directoryName: directoryName))),
                  ),
                  IconButton(
                    icon: Icon(Icons.wifi),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ConnectTree1(directoryName: directoryName))),
                  ),

                ],
              )),
        ),
      );
    }
    else if (directoryName == 'Leaf 1' || directoryName == 'Leaf 2') {
      return Card(
        child: ListTile(
          leading: folderIcon,
          title: Container(
            child: InkWell(
              onTap: () {},
              child: Text(directoryName),
            ),
          ),
          trailing: Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingLeaf(directoryName: directoryName))),
                  ),
                  IconButton(
                    icon: Icon(Icons.bluetooth),
                    onPressed: () =>
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ConnectLeaf(directoryName: directoryName))),
                  ),
                ],
              )),
        ),
      );
    }
  }
}
