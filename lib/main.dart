import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a FlipCardController
    final FlipCardController flipCardController = FlipCardController();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Screen width and height
            double screenWidth = constraints.maxWidth;
            double screenHeight = constraints.maxHeight;

            // Initialize variables for card dimensions
            double cardWidth;
            double cardHeight;

            // Determine the orientation
            if (screenWidth > screenHeight) {
              // Horizontal layout (landscape)
              cardWidth = screenWidth * 0.8; // 80% of the screen width
              cardWidth = cardWidth > 1000
                  ? 1000
                  : cardWidth; // Cap the width at 1000 pixels
              cardHeight = cardWidth *
                  (55 / 85); // Calculate height based on the aspect ratio
            } else {
              // Vertical layout (portrait)
              cardHeight = screenHeight * 0.8; // 80% of the screen height
              cardWidth = cardHeight *
                  (85 / 55); // Calculate width based on the aspect ratio

              // Ensure the card doesn't exceed the screen width
              if (cardWidth > screenWidth) {
                cardWidth = screenWidth *
                    0.8; // Adjust width to 80% of the screen width
                cardHeight = cardWidth *
                    (85 / 55); // Adjust height to maintain aspect ratio
              }
            }

            return Center(
              child: FlipCard(
                controller: flipCardController,
                rotateSide: RotateSide.bottom,
                onTapFlipping: true, // Allows the card to flip on tap
                axis: FlipAxis.horizontal,
                frontWidget: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: cardWidth,
                    height: cardHeight,
                    child: Center(
                      child: Image.asset(
                        'assets/marca.png',
                        width: cardWidth * 0.7, // Adjust image size as needed
                        height: cardHeight * 0.7, // Adjust image size as needed
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                backWidget: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: cardWidth,
                    height: cardHeight,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: screenWidth > screenHeight
                        ? Padding(
                            padding: EdgeInsets.all(
                              cardHeight * 0.1,
                            ),
                            child: Row(
                              // Horizontal layout
                              children: [
                                CircleAvatar(
                                  radius:
                                      cardHeight * 0.15, // Maintain proportion
                                  backgroundImage:
                                      AssetImage('assets/sebas.jpg'),
                                ),
                                SizedBox(width: 40),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Sebastián Martínez Santos',
                                        style: GoogleFonts.interTight(
                                          fontSize: cardWidth *
                                              0.04, // Adjust font size based on card width
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'Estudiante destacado, con experiencia en robótica, desarrollo de software y producción audiovisual. Fluidez en inglés.',
                                        style: GoogleFonts.interTight(
                                          fontSize: cardWidth *
                                              0.03, // Adjust font size based on card width
                                        ),
                                      ),
                                      SizedBox(height: 16),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            buildStyledButton(
                                              icon: Icons.phone,
                                              onPressed: () => launchUrlString(
                                                  'callto:+5492617148982'),
                                            ),
                                            buildStyledButton(
                                              icon: Icons.email,
                                              onPressed: () => launchUrlString(
                                                  'mailto:contact@smartinezs.com'),
                                            ),
                                            buildStyledButton(
                                              icon: FontAwesomeIcons.whatsapp,
                                              onPressed: () => launchUrlString(
                                                  'wa.link/3028h0'),
                                              isFaIcon: true,
                                            ),
                                            buildStyledButton(
                                              icon: FontAwesomeIcons.linkedin,
                                              onPressed: () => launchUrlString(
                                                  'https://www.linkedin.com/in/smartinezs'),
                                              isFaIcon: true,
                                            ),
                                            buildStyledButton(
                                              icon: Icons.description,
                                              onPressed: () => launchUrlString(
                                                  'callto:+5492617148982'),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Column(
                            // Vertical layout
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: cardWidth * 0.2, // Maintain proportion
                                backgroundImage: AssetImage('sebas.jpg'),
                              ),
                              SizedBox(height: 16),
                              SizedBox(height: 20),
                              Text(
                                'Sebastián Martínez S.',
                                style: GoogleFonts.interTight(
                                  fontSize: cardWidth *
                                      0.08, // Adjust font size based on card width
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Text(
                                  'Estudiante destacado, con experiencia en robótica, desarrollo de software y producción audiovisual. Fluidez en inglés.',
                                  style: GoogleFonts.interTight(
                                  
                                    fontSize: cardWidth *
                                        0.05, // Adjust font size based on card width
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    buildStyledButton(
                                      icon: Icons.phone,
                                      onPressed: () => launchUrlString(
                                          'callto:+5492617148982'),
                                    ),
                                    buildStyledButton(
                                      icon: Icons.email,
                                      onPressed: () => launchUrlString(
                                          'mailto:contact@smartinezs.com'),
                                    ),
                                    buildStyledButton(
                                      icon: FontAwesomeIcons.whatsapp,
                                      onPressed: () =>
                                          launchUrlString('wa.link/3028h0'),
                                      isFaIcon: true,
                                    ),
                                    buildStyledButton(
                                      icon: FontAwesomeIcons.linkedin,
                                      onPressed: () => launchUrlString(
                                          'https://www.linkedin.com/in/smartinezs'),
                                      isFaIcon: true,
                                    ),
                                    buildStyledButton(
                                      icon: Icons.description,
                                      onPressed: () => launchUrlString(
                                          'callto:+5492617148982'),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget buildStyledButton(
    {required IconData icon,
    required VoidCallback onPressed,
    bool isFaIcon = false}) {
  return Container(
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(
        color: Colors.black.withOpacity(0.15), // Subtle black line
        width: 1, // Adjust the width for the subtlety
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: Offset(4, 4),
          blurRadius: 8,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: Colors.white,
          offset: Offset(-4, -4),
          blurRadius: 8,
          spreadRadius: 1,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: isFaIcon ? FaIcon(icon) : Icon(icon),
        iconSize: 30,
        onPressed: onPressed,
        color: Colors.black,
      ),
    ),
  );
}
