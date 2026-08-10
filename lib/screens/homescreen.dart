import 'package:flutter/material.dart';
import 'package:legal_helper/models/law_models.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/screens/law_detail.dart';
import 'package:legal_helper/services/law_service.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:legal_helper/widgets/cards.dart';
import 'package:provider/provider.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen>
    with SingleTickerProviderStateMixin {

  List<Laws> allLaws = [];
  List<Laws> filteredLaws = [];

  final TextEditingController searchController = TextEditingController();

  late stt.SpeechToText _speech;
  bool _isListening = false;

  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    loadLaws();

    _speech = stt.SpeechToText();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  void loadLaws() async {
    final laws = await LawService().loadLaws();

    setState(() {
      allLaws = laws;
      filteredLaws = laws;
    });
  }

  void searchLaw(String query) {
    List<Laws> results = allLaws;

    if (query.isNotEmpty) {
      results = results.where((law) {
        final titleEn = law.titleEn.toLowerCase();

        // final reference = law.lawReference.toLowerCase();

        final titleMl = law.titleMl.toLowerCase();

        final input = query.toLowerCase();

        return titleEn.contains(input) ||
            // reference.contains(input) ||
            titleMl.contains(input);
      }).toList();
    }

    setState(() {
      filteredLaws = results;
    });
  }

  Future<void> _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          print("Status: $status");

          if (status == "done" || status == "notListening") {
            _speech.stop();
            _animationController.stop();
            _animationController.reset();

            setState(() {
              _isListening = false;
            });
          }
        },
        onError: (error) {
          print("Error: $error");

          _speech.stop();
          _animationController.stop();
          _animationController.reset();

          setState(() {
            _isListening = false;
          });
        },
      );

      if (available) {
        setState(() {
          _isListening = true;
        });

        _animationController.repeat(reverse: true);

        _speech.listen(
          onResult: (result) {
            setState(() {
              searchController.text = result.recognizedWords;
              searchLaw(result.recognizedWords);
            });
          },
        );
      }
    } else {
      _speech.stop();
      _animationController.stop();
      _animationController.reset();

      setState(() {
        _isListening = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isMalayalam = context.watch<LanguageProvider>().isMalayalam;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 70,
        titleSpacing: 15,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0f4d38), Color(0xff1f6b4f), Color(0xff2f7d5d)],
            ),
          ),
        ),

        title: Row(
          children: [
            Image.asset(
              'assets/images/main_logo.png',
              height: 70,
              width: 70,
              color: Color(0xff03210c),
            ),

            const SizedBox(width: 10),

            const Text(
              'Yaathra Sahayi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.title,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),

            child: GestureDetector(
              onTap: () {
                setState(() {
                  context.read<LanguageProvider>().toggleLanguage();
                });
              },

              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),

                decoration: BoxDecoration(
                  color: const Color(0xffc0e5b3),

                  borderRadius: BorderRadius.circular(18),

                  border: Border.all(color: AppColors.appbar.withOpacity(0.9)),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.language,
                      size: 18,
                      color: Color(0xff759c68),
                    ),

                    const SizedBox(width: 5),

                    Text(
                      isMalayalam ? "EN" : "മ",

                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                height: 50,

                padding: const EdgeInsets.symmetric(horizontal: 18),

                decoration: BoxDecoration(
                  color: AppColors.card,

                  borderRadius: BorderRadius.circular(40),

                  border: Border.all(color: AppColors.border, width: 2),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    /// SEARCH ICON
                    Icon(Icons.search_rounded, color: AppColors.icon, size: 30),

                    const SizedBox(width: 14),

                    Expanded(
                      child: TextField(
                        controller: searchController,
                        onChanged: searchLaw,
                        cursorColor: Colors.white24,
                        decoration: InputDecoration(
                          hintText: "Search laws, fines...",
                          hintStyle: TextStyle(
                            color: Colors.grey.shade700.withOpacity(0.6),
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          border: InputBorder.none,
                        ),
                        style:  TextStyle(
                          color: Colors.blueGrey.shade700,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: _listen,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: _isListening
                                ? Colors.red.withOpacity(0.2)
                                : AppColors.border.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            _isListening ? Icons.mic : Icons.mic_none_rounded,
                            color: _isListening ? Colors.red : AppColors.icon,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                child: _isListening
                    ? Row(
                        key: const ValueKey('Listening '),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.mic, color: Colors.red, size: 16),
                          SizedBox(width: 7),
                          Text(
                            'Listening ...',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ),
              const SizedBox(height: 20),
              if (searchController.text.isNotEmpty)
                filteredLaws.isEmpty
                    ? Center(
                        child: Column(
                          children: [
                            const SizedBox(height: 50),

                            Text(
                              '☹️',
                              style: TextStyle(
                                fontSize: 45,
                                color: Colors.grey.shade400,
                              ),
                            ),

                            const SizedBox(height: 10),

                            const Text(
                              "No matching laws found",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,

                        physics: const NeverScrollableScrollPhysics(),

                        itemCount: filteredLaws.length,

                        itemBuilder: (context, index) {
                          final law = filteredLaws[index];

                          return Card(
                            elevation: 0,

                            color: AppColors.card,

                            margin: const EdgeInsets.only(bottom: 14),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 10,
                              ),

                              title: Text(
                                isMalayalam ? law.titleMl : law.titleEn,

                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black54
                                ),
                              ),

                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 6),

                                child: Text(
                                  law.lawReference,
                                  style: TextStyle(color: Colors.grey.shade600),
                                ),
                              ),

                              trailing: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                              ),

                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LawDetailScreen(
                                      law: law,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),

              if (searchController.text.isEmpty) ...[
                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.all(18),

                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xff1E1E1E) : Colors.white60,

                    borderRadius: BorderRadius.circular(22),

                    border: Border.all(color: AppColors.border),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Row(
                    children: [
                      /// LOGO
                      Image.asset(
                        height: 100,
                        width: 100,
                        "assets/images/logo.png",
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(width: 18),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isMalayalam ? "നമസ്കാരം!" : "Hello!",

                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,

                                color: isDark
                                    ? Colors.white
                                    : AppColors.navigcolor,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              isMalayalam
                                  ? "ഇന്ന് നിങ്ങളെ എങ്ങനെ സഹായിക്കാം?"
                                  : "How can we help\nyou today?",

                              style: TextStyle(
                                height: 1.4,
                                fontSize: 18,

                                color: isDark ? Colors.white70 : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Text(
                  isMalayalam ? "വിഭാഗങ്ങൾ" : "Explore Categories",

                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,

                    color: isDark ? Colors.white : AppColors.navigcolor,
                  ),
                ),

                const SizedBox(height: 20),

                /// CATEGORY GRID
                GridView.count(
                  shrinkWrap: true,

                  physics: const NeverScrollableScrollPhysics(),

                  crossAxisCount: 2,

                  crossAxisSpacing: 14,

                  mainAxisSpacing: 14,

                  children: [
                    CardsCategory(
                      title: isMalayalam ? " ഡ്രൈവിംഗ് നിയമങ്ങൾ " :'Driving Rules',
                      img: 'assets/images/drive.png',
                      category: "Driving Rules",
                    ),

                    CardsCategory(
                      title: isMalayalam ? 'ലംഘനങ്ങൾ' : 'Violations',
                      img: 'assets/images/violations.png',
                      category:'Violations' ,
                    ),

                    CardsCategory(
                      title: isMalayalam ?'രേഖകൾ' : 'Documents',
                      img: 'assets/images/document_logo.png',
                      category:'Documents' ,
                    ),

                    CardsCategory(
                      title: isMalayalam ?'സുരക്ഷ' : 'Safety',
                      img: 'assets/images/safe_logo.png',
                      category:'Safety',
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                safetyTipCard(context),

                const SizedBox(height: 25),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget safetyTipCard(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final isMalayalam = context.watch<LanguageProvider>().isMalayalam;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xff1E1E1E) : const Color(0xffF8FBF2),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.border, width: 1.2),
      ),
      child: Row(
        children: [
          /// Left Icon
          Icon(
            Icons.info_outline,
            color: isDark ? Color(0xffEAF4DF) : AppColors.navigcolor,
            size: 30,
          ),

          const SizedBox(width: 18),

          /// Text
          Expanded(
            child: Text(
              isMalayalam ? "“ നിയമങ്ങൾ അറിയുക, സുരക്ഷിതരായിരിക്കുക\nഉത്തരവാദിത്തത്തോടെ വാഹനമോടിക്കുക.”" :"Know your laws, stay safe\nand drive responsibly.",
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.white70 : const Color(0xff173E2C),
              ),
            ),
          ),

          /// Right Image
          Image.asset("assets/images/leaf.png", height: 58),
        ],
      ),
    );
  }

  void dispose() {
    _animationController.dispose();
    searchController.dispose();
    super.dispose();
  }
}
