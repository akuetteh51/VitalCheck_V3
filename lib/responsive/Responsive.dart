import 'package:flutter/material.dart';




class responsive extends StatelessWidget {
 final Widget Mobile;
final Widget  Desktop;
  const responsive({super.key,required this.Mobile,required  this.Desktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context,constraints){
if(constraints.maxWidth<500){

  return Mobile;


}else{
  return Desktop;
}
    });
  }
}