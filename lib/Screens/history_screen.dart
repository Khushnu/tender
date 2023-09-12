import 'package:flutter/material.dart';
import 'package:tender/Model/datamodel.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key,  required this.req});
final List<DataModel> req;
  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request List'),
      ),
      body: Container(
        height:  MediaQuery.sizeOf(context).height,
        width:  MediaQuery.sizeOf(context).width, 
        child: widget.req.isEmpty ? const Center(child: Text('Request sent List is Empty swipe left to send request'),)  :ListView.builder(
          itemCount: widget.req.length,
          itemBuilder: (_,index){
          var data = widget.req[index];
          return SizedBox(
            height: 78,
            child: Card(
              color: Colors.white60.withOpacity(0.8),
              child: Center(
                child: ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(data.image,)),
                  title: Text('Freind Request Send to ${data.name}'),
                  trailing: InkWell(
                    onTap: (){
                      setState(() {
                        widget.req.remove(widget.req[index]);
                      });
                      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                        backgroundColor: Color.fromARGB(137, 244, 171, 82),
                        content: Text('${data.name} Friend Request Cancel '), 
                        duration: const Duration(seconds: 2),));
                    },
                    child: Container(
                      height: 25, 
                      width: 105,
                      decoration:  BoxDecoration(
                        color: Colors.red.shade200, 
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(child: Text('Cancel Request', style: TextStyle(color: Colors.black, fontStyle: FontStyle.italic),)),
                    ))
                ),
              ),
            ),
          );
        })
      ),
    );
  }
}