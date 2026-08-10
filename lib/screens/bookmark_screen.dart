import 'package:flutter/material.dart';
import 'package:legal_helper/models/law_models.dart';
import 'package:legal_helper/provider/bookmark_provider.dart';
import 'package:legal_helper/provider/language_provider.dart';
import 'package:legal_helper/services/law_service.dart';
import 'package:provider/provider.dart';
import 'package:legal_helper/utils/app_colors.dart';
import 'package:legal_helper/widgets/custom_appbar.dart';
import 'package:legal_helper/screens/law_detail.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  List<Laws> allLaws = [];
  List<Laws> bookmarkedLaws = [];

  final TextEditingController searchController =
  TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadBookmarks();
    });
  }

  Future<void> loadBookmarks() async {
    final laws = await LawService().loadLaws();

    final provider =
    Provider.of<BookmarkProvider>(context, listen: false);

    final savedIds = provider.bookmarkedLaws;

    final savedLaws = laws.where((law) {
      return savedIds.contains(law.id.toString());
    }).toList();

    setState(() {
      allLaws = savedLaws;
      bookmarkedLaws = savedLaws;
    });
  }

  void searchBookmarks(String query) {
    if (query.isEmpty) {
      setState(() {
        bookmarkedLaws = allLaws;
      });

      return;
    }

    final results = allLaws.where((law) {
      return law.titleEn
          .toLowerCase()
          .contains(query.toLowerCase()) ||
          law.titleMl
              .toLowerCase()
              .contains(query.toLowerCase());
    }).toList();

    setState(() {
      bookmarkedLaws = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    final isMalayalam =
        context.watch<LanguageProvider>().isMalayalam;

    return Scaffold(
      backgroundColor:
      Theme.of(context).scaffoldBackgroundColor,

      appBar: CustomAppBar(
        title: isMalayalam
            ? "സേവ് ചെയ്ത നിയമങ്ങൾ"
            : "Saved Laws",
        actions: [],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),

        child: Column(
          children: [
            // =========================
            // SEARCH
            // =========================

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 18,
              ),

              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xff1E1E1E)
                    : Colors.white70,

                borderRadius:
                BorderRadius.circular(40),

                border: Border.all(
                  color: const Color(0xffcfe3bc),
                  width: 1.5,
                ),
              ),

              child: Row(
                children: [
                  Icon(
                    Icons.search_rounded,
                    color: isDark
                        ? Colors.white60
                        : Colors.grey.shade600,
                    size: 28,
                  ),

                  const SizedBox(width: 10),

                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: isDark
                            ? Colors.white70
                            : Colors.black,
                      ),

                      controller:
                      searchController,

                      onChanged:
                      searchBookmarks,

                      decoration:
                      InputDecoration(
                        hintText: isMalayalam
                            ? "ബുക്ക്മാർക്കുകളിൽ തിരയുക..."
                            : "Search bookmarks...",

                        hintStyle: TextStyle(
                          color: isDark
                              ? Colors.white38
                              : Colors.grey.shade500,

                          fontSize: 16,
                        ),

                        border:
                        InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // EMPTY STATE
            // =========================

            if (bookmarkedLaws.isEmpty)
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 80,
                        color:
                        Colors.green.shade200,
                      ),

                      const SizedBox(height: 15),

                      Text(
                        isMalayalam
                            ? "സേവ് ചെയ്ത നിയമങ്ങളൊന്നുമില്ല"
                            : "No saved laws yet",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.w600,
                          color: isDark
                              ? Colors.white70
                              : Colors.black,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        isMalayalam
                            ? "പ്രധാനപ്പെട്ട നിയമങ്ങൾ എളുപ്പത്തിൽ ആക്‌സസ് ചെയ്യുന്നതിനായി ബുക്ക്മാർക്ക് ചെയ്യുക"
                            : "Bookmark important laws for quick access",

                        textAlign:
                        TextAlign.center,

                        style: TextStyle(
                          color: isDark
                              ? Colors.white60
                              : Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              )

            // =========================
            // SAVED LAWS LIST
            // =========================

            else
              Expanded(
                child: ListView.separated(
                  itemCount:
                  bookmarkedLaws.length,

                  separatorBuilder:
                      (context, index) {
                    return Divider(
                      thickness: 0.7,

                      color: isDark
                          ? Colors.white12
                          : Colors.green.shade100,
                    );
                  },

                  itemBuilder:
                      (context, index) {
                    final law =
                    bookmarkedLaws[index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                                LawDetailScreen(
                                  law: law,
                                ),
                          ),
                        );
                      },

                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 12,
                        ),

                        child: Row(
                          children: [
                            // =========================
                            // BOOKMARK ICON
                            // =========================

                            Container(
                              height: 40,
                              width: 40,

                              decoration:
                              BoxDecoration(
                                color: isDark
                                    ? const Color(
                                  0xff2A2A2A,
                                )
                                    : AppColors
                                    .navigicon,

                                borderRadius:
                                BorderRadius.circular(
                                  18,
                                ),
                              ),

                              child: const Icon(
                                Icons
                                    .bookmark_rounded,

                                color:
                                AppColors.container,

                                size: 28,
                              ),
                            ),

                            const SizedBox(width: 15),

                            // =========================
                            // TITLE
                            // =========================

                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,

                                children: [
                                  Text(
                                    isMalayalam
                                        ? law.titleMl
                                        : law.titleEn,

                                    style:
                                    TextStyle(
                                      fontSize: 15,

                                      fontWeight:
                                      FontWeight.w600,

                                      color: isDark
                                          ? Colors
                                          .white70
                                          : Colors.black,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 5,
                                  ),

                                  Text(
                                    law.lawReference,

                                    style:
                                    TextStyle(
                                      fontSize: 12,

                                      color: isDark
                                          ? Colors
                                          .white60
                                          : Colors.grey
                                          .shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // =========================
                            // REMOVE BUTTON
                            // =========================

                            Consumer<
                                BookmarkProvider>(
                              builder: (
                                  context,
                                  provider,
                                  child,
                                  ) {
                                return IconButton(
                                  onPressed: () async {
                                    await provider
                                        .removeBookmark(
                                      law.id.toString(),
                                    );

                                    loadBookmarks();
                                  },

                                  icon: const Icon(
                                    Icons
                                        .bookmark_remove_rounded,

                                    color:
                                    Color(0xff428f5d),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}