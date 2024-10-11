// // ignore_for_file: use_build_context_synchronously

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:my_portfolio_flutter/features/contact-me/domain/model/contact_model.dart';
// import 'package:my_portfolio_flutter/features/contact-me/logic/contact_me_bloc/contact_me_bloc.dart';
// import 'package:my_portfolio_flutter/shared/utils/data_fetch_status.dart';
// import 'package:my_portfolio_flutter/shared/utils/extensions.dart';
// import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';

// import '../../shared/theme/color_manager.dart';
// import '../../shared/theme/theme_getters.dart';
// import 'message_textfield.dart';

// class ContactMeSection extends StatefulWidget {
//   const ContactMeSection({
//     super.key,
//   });

//   @override
//   State<ContactMeSection> createState() => _ContactMeSectionState();
// }

// class _ContactMeSectionState extends State<ContactMeSection> {
//   final ValueNotifier<bool> onHovered = ValueNotifier(false);
//   final nameController = TextEditingController();
//   final lastNameController = TextEditingController();
//   final emailController = TextEditingController();
//   final phoneController = TextEditingController();
//   final messageController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   @override
//   void dispose() {
//     nameController.dispose();
//     lastNameController.dispose();
//     emailController.dispose();
//     phoneController.dispose();
//     messageController.dispose();
//     onHovered.dispose();
//     super.dispose();
//   }

//   /// validate first name
//   String? validateFirstName(String? value) {
//     if (value.isNullOrEmpty) {
//       return 'First name is required';
//     }
//     return null;
//   }

//   /// validate email
//   String? validateEmail(String? value) {
//     if (value.isNullOrEmpty) {
//       return 'Email is required';
//     } else {
//       final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//       if (!emailRegex.hasMatch(value ?? "")) {
//         return 'Enter a valid email address';
//       }
//     }
//     return null;
//   }

//   /// validate phone number
//   String? validatePhone(String value) {
//     if (value.isNullOrEmpty) {
//       return 'Phone number is required';
//     }
//     final regex = RegExp(r'^[0-9]+$');
//     if (!regex.hasMatch(value)) {
//       return 'Please enter a valid phone number';
//     }
//     if (value.length < 10) {
//       return 'Phone number should contain 10 digits';
//     }

//     return null;
//   }

//   /// validate message
//   String? validateMessage(String? value) {
//     if (value.isNullOrEmpty) {
//       return 'Message is required';
//     }
//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ContactMeBloc, ContactMeState>(
//       listenWhen: (previous, current) =>
//           previous.contactAddStatus != current.contactAddStatus,
//       listener: (context, state) {
//         if (state.contactAddStatus == DataFetchStatus.success) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//                 backgroundColor: ColorManager.primary,
//                 content: Text('Contact details submitted successfully')),
//           );
//           nameController.clear();
//           lastNameController.clear();
//           emailController.clear();
//           phoneController.clear();
//           messageController.clear();
//         }

//         if (state.contactAddStatus == DataFetchStatus.failed) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//                 backgroundColor: ColorManager.red,
//                 content: Text(state.errorMessage ?? "")),
//           );
//         }
//       },
//       builder: (context, state) {
//         return Container(
//           padding:
//               context.responsivePadding(horizontal: 533.33, vertical: 149.33),
//           decoration: const BoxDecoration(
//             color: ColorManager.secondary,
//           ),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   'Get In Touch',
//                   style: textTheme(context).titleMedium?.copyWith(
//                       color: ColorManager.whiteColor,
//                       fontSize: context.responsiveFontSize(21.33)),
//                 ),

//                 SizedBox(
//                   height: context.responsiveHeight(21.33),
//                 ),
//                 Text(
//                   'Contact me',
//                   style: textTheme(context).titleMedium?.copyWith(
//                         fontSize: context.responsiveFontSize(64),
//                         color: ColorManager.whiteColor,
//                       ),
//                 ),
//                 SizedBox(
//                   height: context.responsiveHeight(64),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: MessageTextField(
//                         minLines: 1,
//                         maxLines: 1,
//                         messageController: nameController,
//                         showMessageTitle: true,
//                         messageTitle: 'First Name',
//                         validate: validateFirstName,
//                       ),
//                     ),
//                     SizedBox(
//                       width: context.responsiveWidth(20),
//                     ),
//                     Expanded(
//                       child: MessageTextField(
//                         minLines: 1,
//                         maxLines: 1,
//                         messageController: lastNameController,
//                         showMessageTitle: true,
//                         messageTitle: 'Last Name',
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: context.responsiveHeight(32),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Expanded(
//                       child: MessageTextField(
//                         minLines: 1,
//                         maxLines: 1,
//                         messageController: emailController,
//                         showMessageTitle: true,
//                         messageTitle: 'Email',
//                         validate: validateEmail,
//                       ),
//                     ),
//                     SizedBox(
//                       width: context.responsiveWidth(20),
//                     ),
//                     Expanded(
//                       child: MessageTextField(
//                         minLines: 1,
//                         maxLines: 1,
//                         messageController: phoneController,
//                         showMessageTitle: true,
//                         keyboardType: TextInputType.number,
//                         messageTitle: 'Phone number',
//                         validate: (val) => validatePhone(val ?? ""),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: context.responsiveHeight(32),
//                 ),
//                 MessageTextField(
//                   minLines: 5,
//                   maxLines: 10,
//                   messageController: messageController,
//                   showMessageTitle: true,
//                   messageTitle: 'Message',
//                   validate: validateMessage,
//                 ),
//                 SizedBox(
//                   height: context.responsiveHeight(32),
//                 ),

//                 /// submit button
//                 InkWell(
//                   onHover: (value) {
//                     onHovered.value = value;
//                   },
//                   onTap: () {
//                     _submitForm();
//                   },
//                   child: ValueListenableBuilder(
//                       valueListenable: onHovered,
//                       builder: (context, value, _) {
//                         return BlocSelector<ContactMeBloc, ContactMeState,
//                             DataFetchStatus>(
//                           selector: (state) {
//                             return state.contactAddStatus;
//                           },
//                           builder: (context, contactAddStatus) {
//                             return Container(
//                               padding: context.responsivePadding(
//                                   horizontal: 42.67, vertical: 18.67),
//                               decoration: BoxDecoration(
//                                 color: value
//                                     ? ColorManager.secondaryBackground
//                                     : colorScheme(context).primary,
//                                 borderRadius: BorderRadius.circular(
//                                     context.responsiveRadius(8)),
//                               ),
//                               child: contactAddStatus == DataFetchStatus.waiting
//                                   ? SizedBox(
//                                       width: context.responsiveWidth(32),
//                                       child: SpinKitThreeBounce(
//                                         size: context.responsiveRadius(21.33),
//                                         color: ColorManager.whiteColor,
//                                       ),
//                                     )
//                                   : Text(
//                                       'Submit',
//                                       style: textTheme(context)
//                                           .displaySmall
//                                           ?.copyWith(
//                                               color: ColorManager.whiteColor,
//                                               fontSize: context
//                                                   .responsiveFontSize(21.33)),
//                                     ),
//                             );
//                           },
//                         );
//                       }),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   void _submitForm() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       // Store the data in Firebase
//       await _saveContactDetails();
//     }
//   }

//   Future<void> _saveContactDetails() async {
//     final name = nameController.text.trim();
//     final email = emailController.text.trim();
//     final phone = phoneController.text.trim();
//     final message = messageController.text.trim();
//     final lastName = lastNameController.text.trim();
//     context.read<ContactMeBloc>().add(AddContactDetailsToCloud(
//         ContactDetails(name, lastName, email, phone, message)));
//   }
// }

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_portfolio_flutter/features/contact-me/domain/model/contact_model.dart';
import 'package:my_portfolio_flutter/features/contact-me/logic/contact_me_bloc/contact_me_bloc.dart';
import 'package:my_portfolio_flutter/shared/logic/shared_cubit/shared_cubit.dart';
import 'package:my_portfolio_flutter/shared/utils/data_fetch_status.dart';
import 'package:my_portfolio_flutter/shared/utils/enums.dart';
import 'package:my_portfolio_flutter/shared/utils/extensions.dart';
import 'package:my_portfolio_flutter/shared/utils/responsive_padding.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../shared/theme/color_manager.dart';
import '../../shared/theme/theme_getters.dart';
import 'message_textfield.dart';

class ContactMeSection extends StatefulWidget {
  const ContactMeSection({
    super.key,
    required this.index,
    required this.controller,
  });

  final int index;
  final AutoScrollController? controller;

  @override
  State<ContactMeSection> createState() => _ContactMeSectionState();
}

class _ContactMeSectionState extends State<ContactMeSection> {
  final ValueNotifier<bool> onHovered = ValueNotifier(false);
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    messageController.dispose();
    onHovered.dispose();
    super.dispose();
  }

  /// validate first name
  String? validateFirstName(String? value) {
    if (value.isNullOrEmpty) {
      return 'First name is required';
    }
    return null;
  }

  /// validate email
  String? validateEmail(String? value) {
    if (value.isNullOrEmpty) {
      return 'Email is required';
    } else {
      final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      if (!emailRegex.hasMatch(value ?? "")) {
        return 'Enter a valid email address';
      }
    }
    return null;
  }

  /// validate phone number
  String? validatePhone(String value) {
    if (value.isNullOrEmpty) {
      return 'Phone number is required';
    }
    final regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    if (value.length < 10) {
      return 'Phone number should contain 10 digits';
    }

    return null;
  }

  /// validate message
  String? validateMessage(String? value) {
    if (value.isNullOrEmpty) {
      return 'Message is required';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactMeBloc, ContactMeState>(
      listenWhen: (previous, current) =>
          previous.contactAddStatus != current.contactAddStatus,
      listener: (context, state) {
        if (state.contactAddStatus == DataFetchStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: ColorManager.primary,
                content: Text('Contact details submitted successfully')),
          );
          nameController.clear();
          lastNameController.clear();
          emailController.clear();
          phoneController.clear();
          messageController.clear();
        }

        if (state.contactAddStatus == DataFetchStatus.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                backgroundColor: ColorManager.red,
                content: Text(state.errorMessage ?? "")),
          );
        }
      },
      builder: (context, state) {
        return VisibilityDetector(
          key: Key('${widget.index}'),
          onVisibilityChanged: (visibilityInfo) {
            var visiblePercentage = visibilityInfo.visibleFraction * 100;

            if (visiblePercentage > 20) {
              context
                  .read<SharedCubit>()
                  .setSelectedSection(selectedSection: SelectedSection.contact);
            }
          },
          child: Container(
            key: widget.key,
            padding:
                context.responsivePadding(horizontal: 533.33, vertical: 149.33),
            decoration: BoxDecoration(
                color: ColorManager.secondary,
                border: Border.all(
                  color: ColorManager.secondary,
                )),
            child: Form(
              key: _formKey,
              child: AutoScrollTag(
                index: widget.index,
                controller: widget.controller!,
                key: ValueKey(widget.index),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title Animations
                    Text(
                      'Get In Touch',
                      style: textTheme(context).titleMedium?.copyWith(
                          color: ColorManager.whiteColor,
                          fontSize: context.responsiveFontSize(21.33)),
                    )
                        .animate()
                        .fadeIn(duration: 600.ms) // Fade in title
                        .slideY(
                            begin: -0.5,
                            end: 0,
                            curve: Curves.easeOut), // Slide down

                    SizedBox(
                      height: context.responsiveHeight(21.33),
                    ),
                    Text(
                      'Contact me',
                      style: textTheme(context).titleMedium?.copyWith(
                            fontSize: context.responsiveFontSize(64),
                            color: ColorManager.whiteColor,
                          ),
                    )
                        .animate()
                        .fadeIn(
                            delay: 300.ms,
                            duration: 600.ms) // Delay for staggered effect
                        .slideY(
                            begin: -0.5,
                            end: 0,
                            curve: Curves.easeOut), // Slide down
                    SizedBox(
                      height: context.responsiveHeight(64),
                    ),

                    // First and Last Name Animations
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MessageTextField(
                            minLines: 1,
                            maxLines: 1,
                            messageController: nameController,
                            showMessageTitle: true,
                            messageTitle: 'First Name',
                            validate: validateFirstName,
                          )
                              .animate()
                              .fadeIn(
                                  delay: 500.ms,
                                  duration: 600.ms) // Fade and slide in
                              .slideX(
                                  begin: -1.0, end: 0.0, curve: Curves.easeOut),
                        ),
                        SizedBox(
                          width: context.responsiveWidth(20),
                        ),
                        Expanded(
                          child: MessageTextField(
                            minLines: 1,
                            maxLines: 1,
                            messageController: lastNameController,
                            showMessageTitle: true,
                            messageTitle: 'Last Name',
                          )
                              .animate()
                              .fadeIn(delay: 600.ms, duration: 600.ms)
                              .slideX(
                                  begin: 1.0,
                                  end: 0.0,
                                  curve: Curves.easeOut), // Slide in from right
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.responsiveHeight(32),
                    ),

                    // Email and Phone Number Animations
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: MessageTextField(
                            minLines: 1,
                            maxLines: 1,
                            messageController: emailController,
                            showMessageTitle: true,
                            messageTitle: 'Email',
                            validate: validateEmail,
                          )
                              .animate()
                              .fadeIn(delay: 700.ms, duration: 600.ms)
                              .slideX(
                                  begin: -1.0, end: 0.0, curve: Curves.easeOut),
                        ),
                        SizedBox(
                          width: context.responsiveWidth(20),
                        ),
                        Expanded(
                          child: MessageTextField(
                            minLines: 1,
                            maxLines: 1,
                            messageController: phoneController,
                            showMessageTitle: true,
                            keyboardType: TextInputType.number,
                            messageTitle: 'Phone number',
                            validate: (val) => validatePhone(val ?? ""),
                          )
                              .animate()
                              .fadeIn(delay: 800.ms, duration: 600.ms)
                              .slideX(
                                  begin: 1.0, end: 0.0, curve: Curves.easeOut),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: context.responsiveHeight(32),
                    ),

                    // Message Field Animation
                    MessageTextField(
                      minLines: 5,
                      maxLines: 10,
                      messageController: messageController,
                      showMessageTitle: true,
                      messageTitle: 'Message',
                      validate: validateMessage,
                    )
                        .animate()
                        .fadeIn(delay: 900.ms, duration: 600.ms)
                        .slideY(begin: 0.5, end: 0.0, curve: Curves.easeOut),
                    SizedBox(
                      height: context.responsiveHeight(32),
                    ),

                    /// Submit Button Animation
                    InkWell(
                      onHover: (value) {
                        onHovered.value = value;
                      },
                      onTap: () {
                        _submitForm();
                      },
                      child: ValueListenableBuilder(
                          valueListenable: onHovered,
                          builder: (context, value, _) {
                            return BlocSelector<ContactMeBloc, ContactMeState,
                                DataFetchStatus>(
                              selector: (state) {
                                return state.contactAddStatus;
                              },
                              builder: (context, contactAddStatus) {
                                return Container(
                                  padding: context.responsivePadding(
                                      horizontal: 42.67, vertical: 18.67),
                                  decoration: BoxDecoration(
                                    color: value
                                        ? ColorManager.secondaryBackground
                                        : colorScheme(context).primary,
                                    borderRadius: BorderRadius.circular(
                                        context.responsiveRadius(8)),
                                  ),
                                  child: contactAddStatus ==
                                          DataFetchStatus.waiting
                                      ? SizedBox(
                                          width: context.responsiveWidth(32),
                                          child: SpinKitThreeBounce(
                                            size:
                                                context.responsiveRadius(21.33),
                                            color: ColorManager.whiteColor,
                                          ),
                                        )
                                      : Text(
                                          'Submit',
                                          style: textTheme(context)
                                              .displaySmall
                                              ?.copyWith(
                                                  color:
                                                      ColorManager.whiteColor,
                                                  fontSize: context
                                                      .responsiveFontSize(
                                                          21.33)),
                                        ),
                                );
                              },
                            );
                          }),
                    )
                        .animate()
                        .fadeIn(
                            delay: 1000.ms,
                            duration: 600.ms) // Final button animation
                        .slideY(begin: 0.5, end: 0.0, curve: Curves.easeOut),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _submitForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      // Store the data in Firebase
      await _saveContactDetails();
    }
  }

  Future<void> _saveContactDetails() async {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final message = messageController.text.trim();
    final lastName = lastNameController.text.trim();
    context.read<ContactMeBloc>().add(AddContactDetailsToCloud(
        ContactDetails(name, lastName, email, phone, message)));
  }
}
