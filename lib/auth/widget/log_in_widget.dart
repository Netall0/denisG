import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:profff/auth/service/supabase_service.dart';
import 'package:profff/core/colors.dart';

class LogInWidget extends StatefulWidget {
  const LogInWidget({super.key});

  @override
  State<LogInWidget> createState() => _LogInWidgetState();
}

class _LogInWidgetState extends State<LogInWidget> {
  bool isPasswordVisible = false;
  SupabaseService supabaseService = SupabaseService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signIn() async {
    try {
      await supabaseService.signInWithEmail(
          _emailController.text.trim(), _passwordController.text.trim());
    } on Object catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.toString()),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              //hello text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Привет',
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: "new-peninim-mt-2"),
                    ),
                    TextSpan(
                      text: '!',
                      style: TextStyle(
                          fontSize: 32,
                          color: Colors.black,
                          fontFamily: "new-peninim-mt-2",
                          fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),

              // описание

              Text(
                textAlign: TextAlign.center,
                'Заполните Свои Данные Или\nПродолжите Через Социальные Медиа',
                style: TextStyle(
                    fontSize: 16,
                    color: ColorsPallete.sub_text_dark,
                    fontWeight: FontWeight.w400,
                    fontFamily: "new-peninim-mt-2"),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              //email validation
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "new-peninim-mt-2",
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(43, 43, 43, 1)),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'xyz@gmail.com',
                      hintStyle: TextStyle(
                        fontFamily: "new-peninim-mt-2",
                        color: ColorsPallete.sub_text_dark,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: size.height * 0.05,
              ),

              //password
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Пароль",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "new-peninim-mt-2",
                        fontWeight: FontWeight.w600,
                      )),
                  TextField(
                    controller: _passwordController,
                    obscureText: isPasswordVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                          icon: isPasswordVisible
                              ? SvgPicture.asset('assets/Eye-Open.svg')
                              : SvgPicture.asset('assets/Union.svg')),
                      hintText: '********',
                      hintStyle: TextStyle(
                        fontFamily: "new-peninim-mt-2",
                        color: ColorsPallete.sub_text_dark,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Воcстановить',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: "new-peninim-mt-2",
                            color: ColorsPallete.sub_text_dark,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              ElevatedButton(
                onPressed: signIn,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 24)),
                child: Text("Войти",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "new-peninim-mt-2",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: size.height * 0.25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'вы впервые',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "new-peninim-mt-2",
                        color: ColorsPallete.sub_text_dark,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    ' ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: "new-peninim-mt-2",
                        color: ColorsPallete.sub_text_dark,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
