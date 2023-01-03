import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularAssetImage extends StatelessWidget {
  final String path;
  const CircularAssetImage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CircularImage(assetPath: path,);
  }
}

class CircularNetworkImage extends StatelessWidget {
  final String url;
  const CircularNetworkImage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CircularImage(url: url,);
  }
}

class CircularFileImage extends StatelessWidget {
  final String path;
  const CircularFileImage({Key? key,required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _CircularImage(filepath: path,);
  }
}



class _CircularImage extends StatefulWidget {
  final String? filepath, url, assetPath;
  final double radius;
  const _CircularImage({Key? key,this.filepath,this.url,this.assetPath, this.radius = 48}) : super(key: key);

  @override
  State<_CircularImage> createState() => _CircularImageState();
}

class _CircularImageState extends State<_CircularImage> {
  @override
  Widget build(BuildContext context) {
    late ImageProvider provider;
    if (widget.url != null) {
      return _MyNetworkImage(widget.url!,widget.radius);
    } else if (widget.filepath != null) {
      provider = FileImage(File(widget.filepath!),);
    } else {
      provider = AssetImage(widget.assetPath!,);
    }
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(widget.radius))
      ),
      clipBehavior: Clip.hardEdge,
      child: Image(
        image: provider,
        fit: BoxFit.fill,
        width: widget.radius * 2,
        height: widget.radius * 2,
        loadingBuilder: (context, child, progress) {
          if (progress == null) {
            return child;
          }
          return SizedBox(width:widget.radius/2,height: widget.radius/2,child: const CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(child: Icon(Icons.broken_image,size: widget.radius,));
        },
      ),
    );
  }
}

class _MyNetworkImage extends StatelessWidget {
  final String url;
  final double radius;
  const _MyNetworkImage(this.url, this.radius);

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))
      ),
      clipBehavior: Clip.hardEdge,
      child: CachedNetworkImage(
        imageUrl: url,
        width: radius * 2,
        height: radius * 2,
        placeholder: (context, url){
          return const SizedBox(width:24,height: 24,child: CircularProgressIndicator());
        },

        errorWidget: (context, url, error){
          return Center(child: Icon(Icons.broken_image,size: radius,));
        }
      ),
    );
  }
}
