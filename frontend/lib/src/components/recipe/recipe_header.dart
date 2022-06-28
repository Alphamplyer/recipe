
import 'package:flutter/material.dart';
import 'package:frontend/src/shared/const.dart';

class RecipeHeader extends StatelessWidget {
  final String name;
  final String imageUrl;

  const RecipeHeader({Key? key, required this.name, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.0,
      child: Stack(
        children: [
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(child: SizedBox(width: 32.0, height: 32.0, child: CircularProgressIndicator()));
              },
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(color: Colors.black26),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {},
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(kSpace * 2),
                child: Text(name, style: const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}