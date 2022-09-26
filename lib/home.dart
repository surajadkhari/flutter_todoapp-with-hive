import 'package:flutter/material.dart';

import 'app/common/textform_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final height = size.height;
    final width = size.width;
    const primaryColor = Color(0xff25BD34);
    const secondaryColor = Color(0xff139A11);
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffDEE1E4),
                ),
              ),
              Container(
                height: size.height * 0.3,
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
              ),
              //LoginCard
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.035,
                  horizontal: size.width * 0.055,
                ),
                margin: EdgeInsets.only(
                  top: size.height * 0.25,
                  left: size.width * 0.06,
                  right: size.width * 0.06,
                ),
                height: height * 0.5,
                decoration: BoxDecoration(
                  color: const Color(0xffF9F6F6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        style: TextStyle(
                          color: secondaryColor,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      MyFormField(
                        textCapitalization: TextCapitalization.none,
                        icon: Icons.email,
                        hintText: 'Enter your email',
                        controller: emailController,
                        validator: (email) {
                          return null;
                        },
                      ),
                      SizedBox(height: size.height * 0.02),
                      MyFormField(
                        textInputAction: TextInputAction.done,
                        textCapitalization: TextCapitalization.none,
                        controller: passwordController,
                        icon: Icons.lock,
                        hintText: 'Enter your password',
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 12),
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          onPressed: () {},
                          child: const Text("Login"),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Color(0xffA1A0A0),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.03),
                            child: Text(
                              'OR',
                              style: width > 750
                                  ? const TextStyle(
                                      fontSize: 15,
                                    )
                                  : const TextStyle(),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: Color(0xffA1A0A0),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          CircleAvatarLogo(
                              logoUrl:
                                  "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png"),
                          CircleAvatarLogo(
                              logoUrl:
                                  "https://toppng.com/uploads/preview/facebook-logo-png-transparent-facebook-logo-vector-11563281457ym8xqwasgy.png"),
                          CircleAvatarLogo(
                              logoUrl:
                                  "https://www.freepnglogos.com/uploads/twitter-logo-png/twitter-logo-vector-png-clipart-1.png"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Don't have an account?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Sign Up",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w800, color: primaryColor),
          )
        ],
      ),
    );
  }
}

class CircleAvatarLogo extends StatelessWidget {
  const CircleAvatarLogo({Key? key, required this.logoUrl}) : super(key: key);

  final String logoUrl;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 23,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        maxRadius: 22,
        backgroundColor: const Color(0xffF9F6F6),
        backgroundImage: NetworkImage(logoUrl),
      ),
    );
  }
}
