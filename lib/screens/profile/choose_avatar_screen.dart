import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hms/core/app_colors.dart';

class ChooseAvatar extends StatefulWidget {
  @override
  State<ChooseAvatar> createState() => _ChooseAvatarState();
}

class _ChooseAvatarState extends State<ChooseAvatar> {
  int selectedIndex = 0;

  final avatars = const [
    "https://api.dicebear.com/6.x/bottts/png?seed=char1", // animated style avatar
    "https://api.dicebear.com/6.x/bottts/png?seed=char2",
    "https://api.dicebear.com/6.x/bottts/png?seed=char3",
    "https://api.dicebear.com/6.x/bottts/png?seed=char4",
    "https://api.dicebear.com/6.x/bottts/png?seed=char5",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: Column(
          children: [
            const Icon(Icons.arrow_drop_up, size: 40, color: Colors.black54),

            CarouselSlider.builder(
              options: CarouselOptions(
                height: 220,
                viewportFraction: 0.45,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() => selectedIndex = index);
                },
              ),
              itemCount: avatars.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                final bool isSelected = index == selectedIndex;
                // return ClipOval(
                //   child: Image.network(
                //     avatars[index],
                //     height: 150,
                //     width: 150,
                //     fit: BoxFit.cover,
                //   ),
                // );

                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  padding: EdgeInsets.all(8),
                  child: ColorFiltered(
                    colorFilter: isSelected
                        ? const ColorFilter.mode(
                            Colors.transparent,
                            BlendMode.multiply,
                          )
                        : const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.saturation,
                          ),

                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? AppColors.primaryColor
                              : AppColors.greyColor,
                          width: isSelected ? 4 : 3,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          avatars[index],
                          height: isSelected ? 150 : 100,
                          width: isSelected ? 150 : 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),

            const Icon(Icons.arrow_drop_down, size: 40, color: Colors.black54),

            const SizedBox(height: 30),

             ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Selected avatar #${selectedIndex + 1}")),
                );
              },
              child: const Text("Select Avatar",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            )

            


          ],
        ),
      ),
    );
  }
}
