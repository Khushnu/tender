import 'package:flutter/material.dart';

class BottomButtonsWidget extends StatefulWidget {
  const BottomButtonsWidget({super.key, required this.icon, required this.onTap});
  final IconData icon; 
  final Function() onTap;
  @override
  State<BottomButtonsWidget> createState() => _BottomButtonsWidgetState();
}

class _BottomButtonsWidgetState extends State<BottomButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
                    height: 60, 
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), 
                      color: Colors.white
                    ), 
                    child: IconButton(onPressed: widget.onTap, icon:  Icon(widget.icon, size: 40, color: Colors.red,)),
            
                  );
  }
}