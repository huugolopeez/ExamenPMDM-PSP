import 'package:flutter/material.dart';

import '../singletone/DataHolder.dart';

class PostCellView extends StatelessWidget {

  final String sTitle;
  final String sBody;
  final String sImage;
  final double dFontSize;
  final int iPosition;
  final Function(int indice)? onItemTap;

  const PostCellView({super.key,
    required this.sTitle,
    required this.sBody,
    required this.sImage,
    required this.dFontSize,
    required this.iPosition,
    this.onItemTap
  });

  @override
  Widget build(BuildContext context) {

    return InkWell(
        onTap: () { onItemTap!(iPosition); },
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: DataHolder().colorPrincipal
            ),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    children: [
                      Text(
                          sTitle,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              color: DataHolder().colorTerciario,
                              fontSize: dFontSize
                          )),
                      Text(
                          sBody,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          style: TextStyle(
                              color: DataHolder().colorTerciario,
                              fontSize: dFontSize
                          )),
                      if(sImage != '')
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Image.network(sImage, height: 200)
                        )
                    ])
            )
        )
    );
  }
}