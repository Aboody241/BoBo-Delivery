import 'package:flutter/material.dart';

class UploadProfilePhoto extends StatelessWidget {
  const UploadProfilePhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 90),
      child: Stack(
        children: [
        
    
          Center(
            child: CircleAvatar(
              maxRadius: 70,
              backgroundColor: const Color.fromARGB(255, 152, 152, 152),
              child: Icon(
                Icons.person_outline_rounded,
                size: 55,
                color: const Color.fromARGB(255, 254, 254, 254),
              ),
            ),
          ),
    
            Positioned(
              bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () {
                
              },
              child: Container(
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white,width: 5),
                  shape: BoxShape.circle,
                  color: const Color.fromARGB(255, 229, 229, 229),
                ),
                child: Icon(Icons.camera_alt_rounded, size: 30 , color: const Color.fromARGB(255, 141, 141, 141),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
