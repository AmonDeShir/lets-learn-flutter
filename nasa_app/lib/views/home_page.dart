import 'dart:math';

import 'package:nasa_app/main.dart';
import 'package:nasa_app/models/nasa_image.dart';
import 'package:nasa_app/services/remote_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const imageSize = 400;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NasaImages? images;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    fetchData("andromeda");    
  }

  fetchData(String text) async {
    setState(() { isLoaded = false; });
    images = await RemoteService().search(text);

    if (images != null) {
      setState(() { 
        isLoaded = true; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) {
        return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 200,
                    child: Image(image: AssetImage("assets/nasa.png")),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 30.0, end: 30.0),
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(CupertinoIcons.search),
                        labelText: 'Search',
                        prefixIconColor: Color.fromRGBO(196, 196, 196, 1.0),
                        labelStyle: TextStyle(
                          color: Color.fromRGBO(196, 196, 196, 1.0)
                        ),
                      ),
                      onSubmitted: (text) => fetchData(text),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Builder (
                        builder: (context) {
                          if (!isLoaded) {
                            return Center(child: LoadingAnimationWidget.halfTriangleDot(color: nasaRed, size: 50));
                          }

                          return MasonryGridView.count(
                            crossAxisCount: max(2, (MediaQuery.sizeOf(context).width / imageSize).floor()),
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            itemCount: images!.items.length,
                            itemBuilder: (context, index) {
                              return Image(image: NetworkImage(images!.items[index].link));
                            },
                          );
                        }
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
      }
    );
  }
}