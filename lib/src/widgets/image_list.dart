//Local import
import '../Models/image_model.dart';
//package import
import 'package:flutter/material.dart';

class ImageList extends StatelessWidget
{
 final List<ImageModel> images;

   ImageList(this.images);
   
    Widget build(context){
        return ListView.builder(itemCount: images.length,
        itemBuilder: (context, int index)
        {
          
        },
        );
    }
     }
