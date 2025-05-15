import 'package:flutter/material.dart';

class NoteTile extends StatelessWidget {
  const NoteTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height*0.08,

      decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Your Title Here",style: TextStyle(fontSize: 18,color: Colors.white),),
                Text("Few Lines of your encrypted Note here",style: TextStyle(fontSize: 16,color: Colors.green),),
              ],
            ),
            Spacer(),
            Icon(Icons.delete,color: Colors.red,),
          ],
        ),
      ),
    );
  }
}
