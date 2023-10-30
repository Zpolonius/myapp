//Local import
import 'dart:html';

import '../Models/image_model.dart';
//package import
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget
{
 final List<ImageModel> images;

    ImageList(this.images, {super.key});
   
    @override
      Widget build(context){
        return ListView.builder(itemCount: images.length,
        itemBuilder: (context, int index)
        {
          return Text(images[index].id as String);
        },
        );
    }
     }
